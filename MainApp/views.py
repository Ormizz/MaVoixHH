import random
from django.http import JsonResponse
from django.db.models import Count, Q
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
import requests
from rest_framework import viewsets
from django.contrib.auth import authenticate, login, logout
from candidat.models import Article, Candidat

from MainApp.models import *
from votes.models import Proposition, Vote, Zone
from MainApp.serializers import ElecteurSerialiser


# Création des vues

# class UserViewSet(viewsets.ModelViewSet):
    
#     queryset = User.objects.all()
#     serializer_class = UserSerializer
    
class ElecteurViewSet(viewsets.ModelViewSet):
    
    queryset = Electeur.objects.all()
    serializer_class = ElecteurSerialiser
    
    
def connexion(request):
	if request.method=='POST':
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(username=username, password=password)
		if user is not None :
			login(request,user)
			return redirect("actuality")

		else:
			messages.info(request,"erreur d'authentification")
			return redirect("index")

	else:
		return render(request,'accueil.html')

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

def carte(request):
       return render(request,'carte.html', {
            'candidats' : Candidat.objects.all(),
            'zone': Ville.objects.all(),
    })

def get_candidats(request):
    zone = request.GET.get('zone')
    candidats = Candidat.objects.filter(Ville__libelle=zone).values('nom', 'prenoms', 'parti_politique', 'pk')
    return JsonResponse(list(candidats), safe=False)

def listCandidat(request, id):

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