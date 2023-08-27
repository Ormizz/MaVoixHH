from itertools import groupby
import random
from django.http import JsonResponse, Http404
from django.db.models import Count, Q
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User, Group

from rest_framework import viewsets
from django.contrib.auth import authenticate, login, logout
from candidat.models import Article, Candidat

from MainApp.models import *
from votes.models import Proposition, Themes_cles, Vote, Zone
from MainApp.serializers import ElecteurSerialiser


# Création des vues

# class UserViewSet(viewsets.ModelViewSet):
    
#     queryset = User.objects.all()
#     serializer_class = UserSerializer
    
class ElecteurViewSet(viewsets.ModelViewSet):
    
    queryset = Electeur.objects.all()
    serializer_class = ElecteurSerialiser
    
def is_admin(user):
    return user.is_authenticated and user.is_staff

# Fonction qui vérifie si l'utilisateur appartient au groupe "candidat"
def is_candidat(user):
    return user.is_authenticated and user.groups.filter(name='candidat').exists()

# Fonction qui vérifie si l'utilisateur appartient au groupe "electeur"
def is_electeur(user):
    return user.is_authenticated and user.groups.filter(name='electeur').exists()


def connexion(request):
    if request.method=='POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if (is_electeur(user)):
            login(request,user)
            return redirect("actuality")		
        elif (is_admin(user)):
            login(request,user)
            return redirect("analytic", 1)		
        elif (is_candidat(user)):
            login(request,user)
            return redirect("thematique")		
        else:
            return redirect("index")
	

@login_required
def deconnexion(request):
	logout(request)
	return redirect("index")

def SignUp(request):
    print("dzad")
    if request.method == 'POST':
        print("in")
        user = User.objects.create_user(
            username = request.POST['username'], 
            email = request.POST['email'],
            password = request.POST['password'], 
        )
        user.save()
        print("user ok")
        ville_id = request.POST['Ville']
        ville_instance = Ville.objects.get(pk=ville_id)
        electeur = Electeur.objects.create(
            nom = request.POST['nom'],
            prenoms = request.POST['prenoms'],
            date_naissance = request.POST['date_naissance'],
            lieu_naissance = request.POST['lieu_naissance'],
            sexe = request.POST['sexe'],
            user_id = user.pk,
            Ville = ville_instance,
            contact = request.POST['contact'],
        )
        electeur.save()
        print("electeur ok")
        electeurGroup = Group.objects.get(name='Electeur')
        user.groups.add(electeurGroup)
        return redirect("login2")
    return render(request, 'login2.html')


@login_required
def actuality(request):
    
    if not is_electeur(request.user):
        raise Http404  # Redirection vers la page d'erreur 404
    else:
        # Obtenez le nombre total d'objets dans la table
        total_objects = Candidat.objects.count()
        if total_objects>3:
            # Générez trois indices aléatoires
            random_indices = random.sample(range(1,total_objects+1), 3)
        else:
            random_indices = random.sample(range(1,total_objects+1), 2)
        print(random_indices) 
        # Obtenez les trois objets correspondants aux indices aléatoires
        random_candidat = Candidat.objects.filter(pk__in=random_indices)
        
        for cand in random_candidat:
            print(cand.nom)
        
        actualite = Article.objects.all()
        is_candidat = request.user.groups.filter(name='Candidat').exists()
        utilisateur = request.user
        return render(request, 'index.html', {
            'user': utilisateur, 
            'articles': actualite,
            'rdCandidat': random_candidat,
            'is_candidat':is_candidat,
            }
        )
    
    
@login_required
def propositionfunc(request):
    
    # Obtenez les trois objets correspondants aux indices aléatoires
    random_candidat = Candidat.objects.all()[:3]
    
    for cand in random_candidat:
        print(cand.nom)
    proposition = Proposition.objects.all()
    
    utilisateur = request.user
    return render(request, 'proposition.html', {
        'user': utilisateur, 
        'propositions': proposition,
        'rdCandidat': random_candidat,
        }
    )

def login2(request):
    localisations = Ville.objects.all()
    return render(request, 'login2.html',{
        'localisations': localisations
    })

def index(request):
    return render(request, 'accueil2.html')


@login_required
def profileU(request):
    
    if not is_electeur(request.user):
        raise Http404  # Redirection vers la page d'erreur 404
    else:
        # Récupérer le nom du groupe du candidat
        # user_group = request
        utilisateur = request.user
        localisations = Ville.objects.all()
        # print(actualite)
        return render(request, 'profile.html',{
                'user':utilisateur,
                'localisations': localisations
            })
    
@login_required
def editUser(request):
    
    if not is_electeur(request.user):
        raise Http404  # Redirection vers la page d'erreur 404
    else:
        # Récupérer le nom du groupe du candidat
        # user_group = request
        electeur = Electeur.objects.get(pk=request.user.electeur.pk)
        if request.method == 'POST':
            electeur.nom = request.POST["nom"]
            electeur.prenoms = request.POST["prenoms"]
            electeur.date_naissance = request.POST["date_naissance"]
            electeur.lieu_naissance = request.POST["lieu_naissance"]
            electeur.sexe = request.POST["sexe"]
            ville_id = request.POST['Ville']
            ville_instance = Ville.objects.get(pk=ville_id)
            electeur.Ville = ville_instance
            electeur.save()
            return redirect("profileU")
        return render(request, 'profileU.html')

@login_required
def carte(request):
    
    if not is_electeur(request.user):
        raise Http404  # Redirection vers la page d'erreur 404
    else:
        return render(request,'carte.html', {
            'candidats' : Candidat.objects.all(),
            'zone': Ville.objects.all(),
        })

def get_candidats(request):
    zone = request.GET.get('zone')
    candidats = Candidat.objects.filter(Ville__libelle=zone).values('nom', 'prenoms', 'parti_politique', 'pk')
    return JsonResponse(list(candidats), safe=False)

@login_required
def listCandidat(request, id):

    if not is_electeur(request.user):
        raise Http404  # Redirection vers la page d'erreur 404
    else:
        # Obtenez tous les candidats avec leur cote de popularité, le nombre de votes "pour" et le nombre de votes "contre"
        candidats_vote_info = Candidat.objects.filter(Ville=id).annotate(
            num_votes=Count('vote'),
            num_votes_pour=Count('vote', filter=Q(vote__nature_vote='Pour')),
            num_votes_contre=Count('vote', filter=Q(vote__nature_vote='Contre')),
        )
        nbre_vote_ville = Vote.objects.filter(ville= id).count()

        for candidat in candidats_vote_info:
            candidat.nbre_vote_ville = nbre_vote_ville
            if nbre_vote_ville != 0:
                candidat.ratio_vote_ville = int((candidat.num_votes_pour / nbre_vote_ville) * 100)
            else:
                candidat.ratio_vote_ville = 0.0
        candidats_vote_info_trie = sorted(candidats_vote_info, key=lambda candidat: candidat.ratio_vote_ville, reverse=True)[:3]
        
        candidats_vote_info = sorted(
        candidats_vote_info,
        key=lambda candidat:  candidat.nom,
        reverse=True)

        return render(request, 'listCandidat.html', {
            'candidats' : candidats_vote_info,
            'villes' : Ville.objects.all(),
            'id':id,
            'candidats_vote_podium':candidats_vote_info_trie,
        })
    
  
@login_required
def analytic(request, id):
    if not is_admin(request.user):
        raise Http404  # Redirection vers la page d'erreur 404 pour les non-administrateurs
    else:
        # Obtention des propositions par thematiques
        all_purposes = Proposition.objects.filter(ville_id = id)
        # Triez les propositions par thématique
        all_purposes = sorted(all_purposes, key=lambda purpose: purpose.themes_cles_id)

        # Groupement des propositions par thématique
        grouped_purposes = {}
        for theme, group in groupby(all_purposes, key=lambda purpose: purpose.themes_cles_id):
            grouped_purposes[theme] = list(group)

        # Calcul des informations de vote pour chaque groupe de propositions
        for theme, purposes in grouped_purposes.items():
            for purpose in purposes:
                # print(theme, purpose)
                # Obtenir la liste des propositions votées
                all_purposes_voted = Vote.objects.filter(proposition_id=purpose.pk)
                # Compter les votes "pour" et les votes "contre"
                num_votes_pour = all_purposes_voted.filter(nature_vote='Pour').count()
                num_votes_contre = all_purposes_voted.filter(nature_vote='Contre').count()
                num_votes_total = num_votes_contre + num_votes_pour
                ratio_votes_contre = (num_votes_contre / num_votes_total)*100 if num_votes_total > 0 else 0
                ratio_votes_pour = (num_votes_pour / num_votes_total)*100 if num_votes_total > 0 else 0
                # Ajout des informations aux attributs temporaires de l'instance Proposition
                setattr(purpose, 'num_votes_pour', num_votes_pour)
                setattr(purpose, 'num_votes_contre', num_votes_contre)
                setattr(purpose, 'num_votes_total', num_votes_total)
                setattr(purpose, 'ratio_votes_contre', ratio_votes_contre)
                setattr(purpose, 'ratio_votes_pour', ratio_votes_pour)

        # Triez les propositions par thématique
        all_purposes = sorted(all_purposes, key=lambda purpose: purpose.themes_cles_id)

        # Groupement des propositions par thématique
        grouped_purposes = {}
        for theme, group in groupby(all_purposes, key=lambda purpose: purpose.themes_cles_id):
            grouped_purposes[theme] = sorted(list(group), key=lambda purpose: purpose.ratio_votes_pour, reverse=True)

        # Obtenez tous les candidats avec leur cote de popularité, le nombre de votes "pour" et le nombre de votes "contre"
        candidats_vote_info = Candidat.objects.filter(Ville=id).annotate(
            num_votes=Count('vote'),
            num_votes_pour=Count('vote', filter=Q(vote__nature_vote='Pour')),
            num_votes_contre=Count('vote', filter=Q(vote__nature_vote='Contre')),
        )
        nbre_vote_ville = Vote.objects.filter(ville= id).count()

        for candidat in candidats_vote_info:
            candidat.nbre_vote_ville = nbre_vote_ville
            if nbre_vote_ville != 0:
                candidat.ratio_vote_ville = int((candidat.num_votes_pour / nbre_vote_ville) * 100)
            else:
                candidat.ratio_vote_ville = 0.0
        candidats_vote_info_trie = sorted(candidats_vote_info, key=lambda candidat: candidat.ratio_vote_ville, reverse=True)
        
        candidats_vote_info = sorted(
        candidats_vote_info,
        key=lambda candidat:  candidat.nom,
        reverse=True)
        
        candidat_count= Candidat.objects.filter(Ville=id).count()
        
        article_count = 0
        
        for candidat in Candidat.objects.filter(Ville=id):
            article_count+=Article.objects.filter(candidat = candidat).count()
        
        print(all_purposes)
        return render(request, 'analytics.html', {
            'candidat_count' : candidat_count,
            'Article_count' : article_count,
            'user_count' : Electeur.objects.filter(Ville_id=id).count(),
            'theme_count' : Themes_cles.objects.count(),
            'villes' : Ville.objects.all(),
            'themes' : Themes_cles.objects.all(),
            'candidats_vote_podium':candidats_vote_info_trie,
            'all_purposes' : grouped_purposes.items(),
        })
        
    


@login_required
def G_electeur(request):
    
    if not is_admin(request.user):
        raise Http404  # Redirection vers la page d'erreur 404 pour les non-administrateurs
    else:
        return render(request, 'G_electeur.html',{
            'electeurs':Electeur.objects.all()
        })

@login_required
def G_candidat(request):
    
    if not is_admin(request.user):
        raise Http404  # Redirection vers la page d'erreur 404 pour les non-administrateurs
    else:
        return render(request, 'G_candidat.html',{
            'candidats':Candidat.objects.all(),
            'localisations' : Ville.objects.all()
        })
    
@login_required   
def DeleteCand(request, id):
    
    if not is_admin(request.user):
        raise Http404  # Redirection vers la page d'erreur 404 pour les non-administrateurs
    else:
        candidat = Candidat.objects.get(pk=id)

        if request.method == 'POST':
            candidat.delete()
            return redirect("G_candidat")
        
        return render(request, 'G_candidat.html')

@login_required  
def DeleteElec(request, id):
    

    if not is_admin(request.user):
        raise Http404  # Redirection vers la page d'erreur 404 pour les non-administrateurs
    else:
        electeur = Electeur.objects.get(pk=id)
        if request.method == 'POST':
            electeur.delete()
            return redirect("G_electeur")
        
        return render(request, 'G_electeur.html')
    
@login_required
def CreateCand(request):
    if not is_admin(request.user):
        raise Http404  # Redirection vers la page d'erreur 404 pour les non-administrateurs
    else:
        if request.method == 'POST':
            ville_id = request.POST['Ville']
            ville_instance = Ville.objects.get(pk=ville_id)
            photoPP = request.FILES.get('photoPP')
            photoFond = request.FILES.get('photoFond')
            user = User.objects.create_user(
                username = request.POST["date_naissance"][:6]+request.POST['nom'][:2]+request.POST['prenoms'][:2], 
                email = request.POST['email'],
                password = request.POST["date_naissance"][:6]+request.POST['nom'][:2]+request.POST['prenoms'][:2], 
            )
            user.save()
            candidat = Candidat.objects.create(
                nom = request.POST["nom"],
                prenoms = request.POST["prenoms"],
                surnom = request.POST["surnom"],
                date_naissance = request.POST["date_naissance"],
                lieu_naissance = request.POST["lieu_naissance"],
                parti_politique = request.POST["parti_politique"],
                sexe = request.POST["sexe"],
                biographie = request.POST["biographie"],
                Ville = ville_instance,
                image = photoPP,
                fond = photoFond,
                user_id = user.pk,
            ) 
            candidat.save()
            CandidatGroup = Group.objects.get(name='Candidat')
            user.groups.add(CandidatGroup)
            return redirect("G_candidat")
    
    
def error(request):
    return (request, '404.html')