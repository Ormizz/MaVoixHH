from django.http import Http404
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
from django.contrib.auth import authenticate, login, logout
from django.db.models import Count
import random
import requests
from rest_framework import viewsets
from itertools import groupby
from MainApp.models import Electeur
from candidat.models import *
from candidat.serializers import *
from votes.models import *
from MainApp.views import is_admin, is_candidat, is_electeur


class ArticleViewSet(viewsets.ModelViewSet):
    
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer
    
class ElectionViewSet(viewsets.ModelViewSet):
    
    queryset = Election.objects.all()
    serializer_class = ElectionSerializer
    
class CandidatViewSet(viewsets.ModelViewSet):
    
    queryset = Candidat.objects.all()
    serializer_class = CandidatSerializer
    
class Question_electoralViewSet(viewsets.ModelViewSet):
    
    queryset = Question_electoral.objects.all()
    serializer_class = Question_electoralSerializer
    
class Proposition_electoralViewSet(viewsets.ModelViewSet):
    
    queryset = Proposition_electoral.objects.all()
    serializer_class = Proposition_electoralSerializer

    
# Create your views here
@login_required
def index(request, id):
    toutes_les_Candidat = Candidat.objects.all()
    Candidat_aleatoires = random.sample(list(toutes_les_Candidat), 3) 
    
    images = ImagesPUB.objects.all()  # Récupérez toutes les images depuis votre modèle
    candidats_avec_votes_pour = Candidat.objects.filter(
            vote__candidat_id=id, vote__nature_vote='pour'
        ).annotate(num_votes_pour=Count('vote')).order_by('-num_votes_pour')
    
    for candidats_avec_votes_pours in candidats_avec_votes_pour:
        nbr_pour =candidats_avec_votes_pours.num_votes_pour

    candidats_avec_votes_contre = Candidat.objects.filter(
            vote__candidat_id=id, vote__nature_vote='contre'
        ).annotate(num_votes_pour=Count('vote')).order_by('-num_votes_pour')
    
    for candidats_avec_votes_contres in candidats_avec_votes_contre:
        nbr_contre =candidats_avec_votes_contres.num_votes_pour
        
    candidatId = Candidat.objects.get(pk=id)
    
    id_v = candidatId.Ville.id_Ville
        
    nombre_de_votes = Vote.objects.filter(ville_id=id_v).count()
    
    pourcentage_pour = int(nbr_pour/nombre_de_votes*100)
    pourcentage_contre = int(nbr_contre/nombre_de_votes*100)
    
    print(nbr_pour,"/",nombre_de_votes,"=",pourcentage_pour)
    if images:
        image_aleatoire = random.choice(images) 
    return render(request,'candidat/Candidat.html',{
        'candidat': Candidat.objects.get(pk=id),
        'articles': Article.objects.filter(candidat_id = id).order_by('-date_creation'),
        'propositions' : Proposition.objects.filter(candidat_id = id),
        'equipes' : Equipe.objects.filter(candidat_id = id),
        'image_aleatoire': image_aleatoire,
        'Candidat_aleatoires': Candidat_aleatoires,
        'pourcentage_pour': pourcentage_pour,
        'pourcentage_contre': pourcentage_contre,
    })
    
    
@login_required  
def profile(request):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        # Récupérer le nom du groupe du candidat
        # user_group = request
        utilisateur = request.user
        all_theme = Themes_cles.objects.all()
        localisations = Ville.objects.all()
        if(hasattr(utilisateur, 'candidat')):
            actualite = Article.objects.filter(candidat=utilisateur.candidat.pk)
            propositions = Proposition.objects.filter(candidat=utilisateur.candidat.pk)
            if (request.user.groups.filter(name='Candidat').exists()):
                return render(request, 'candidat/profile.html',{
                    'user':utilisateur,
                    'actualites':actualite,
                    'propositions':propositions,
                    'all_theme':all_theme,
                    'localisations': localisations,
                    'equipes' : Equipe.objects.filter(candidat_id = request.user.candidat.pk)
                })
        return render(request, 'candidat/Candidat.html')
    
    
@login_required  
def profileCreateProp(request):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        # Récupérer le nom du groupe du candidat
        # user_group = request
        if request.method == 'POST':
            prop = Proposition.objects.create(
                libelle_proposition = request.POST['libelle_proposition'], 
                candidat_id = request.user.candidat.pk,
                themes_cles_id = request.POST['themes_cles_id'],
            )
            prop.save()
            return redirect("profileC")
        return render(request, 'candidat/profile.html')
    

@login_required  
def profileCreateArt(request):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        # Récupérer le nom du groupe du candidat
        # user_group = request
        if request.method == 'POST':
            photoPP = request.FILES.get('photoPP')

            article = Article.objects.create(
                titre = request.POST['titre'], 
                candidat_id = request.user.candidat.pk,
                content = request.POST['content'],
                image = photoPP,
            )
            article.save()
            return redirect("profileC")
        return render(request, 'candidat/profile.html')

@login_required  
def profileCreateEquipe(request):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        # Récupérer le nom du groupe du candidat
        # user_group = request
        if request.method == 'POST':
            photoPP = request.FILES.get('photoPP')

            equipe = Equipe.objects.create(
                nomPrenom = request.POST['nomPrenom'], 
                candidat_id = request.user.candidat.pk,
                poste = request.POST['poste'],
                image = photoPP,
            )
            equipe.save()
            return redirect("profileC")
        return render(request, 'candidat/profile.html')
    

@login_required  
def profileModifEquipe(request, id):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        equipe = Equipe.objects.get(pk=id)
    
        if request.method == 'POST':
            equipe.nomPrenom = request.POST['nomPrenom']
            equipe.candidat_id = request.user.candidat.pk
            equipe.poste = request.POST['poste']
            if (request.FILES.get('photoPP')):
                photoPP = request.FILES.get('photoPP')
                equipe.image = photoPP
        
            equipe.save()
            return redirect("profileC")
        
        return render(request, 'candidat/profile.html')
    

@login_required  
def profileModifProp(request, id):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        propo = Proposition.objects.get(pk=id)
    
        if request.method == 'POST':
            propo.libelle_proposition = request.POST['libelle_proposition']
            propo.candidat = request.user.candidat
            themes_cles_id = request.POST['themes_cles_id']
            theme_cles = Themes_cles.objects.get(pk=themes_cles_id)
            propo.themes_cles = theme_cles
        
            propo.save()
            return redirect("profileC")
        
        return render(request, 'candidat/profile.html')
    

@login_required  
def profileModifArt(request, id):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        # Récupérer le nom du groupe du candidat
        # user_group = request
        actu = Article.objects.get(pk=id)
        if request.method == 'POST':
            actu.titre = request.POST['titre']
            actu.candidat = request.user.candidat  # Utilisez l'attribut candidat de l'article
            actu.content = request.POST['content']
            photoPP = request.FILES.get('photoPP')
            if (photoPP):
                actu.image = photoPP
            
            actu.save()
            return redirect("profileC")
        return render(request, 'candidat/profile.html')
    

@login_required  
def editcandidat(request):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        # Récupérer le nom du groupe du candidat
        # user_group = request
        candidat = Candidat.objects.get(pk=request.user.candidat.pk)
    
        if request.method == 'POST':
            candidat.nom = request.POST["nom"]
            candidat.prenoms = request.POST["prenoms"]
            candidat.surnom = request.POST["surnom"]
            candidat.date_naissance = request.POST["date_naissance"]
            candidat.lieu_naissance = request.POST["lieu_naissance"]
            candidat.parti_politique = request.POST["parti_politique"]
            candidat.sexe = request.POST["sexe"]
            candidat.biographie = request.POST["biographie"]
            ville_id = request.POST['Ville']
            ville_instance = Ville.objects.get(pk=ville_id)
            candidat.Ville = ville_instance
            photoPP = request.FILES.get('photoPP')
            if photoPP:
                candidat.image = photoPP
            photoFond = request.FILES.get('photoFond')
            if photoFond:
                candidat.fond = photoFond
            candidat.save()
            return redirect("profileC")
        
        return render(request, 'candidat/profile.html')
    
  
@login_required     
def profileDeleteProp(request, id):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        propo = Proposition.objects.get(pk=id)
    
        if request.method == 'POST':
            propo.delete()
            return redirect("profileC")
        
        return render(request, 'candidat/profile.html')
    

@login_required     
def profileDeleteEquipe(request, id):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        equipe = Equipe.objects.get(pk=id)
    
        if request.method == 'POST':
            equipe.delete()
            return redirect("profileC")
        
        return render(request, 'candidat/profile.html')
    

@login_required  
def profileDeleteArticle(request, id):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        article = Article.objects.get(pk=id)
    
        if request.method == 'POST':
            article.delete()
            return redirect("profileC")
        
        return render(request, 'candidat/profile.html')
    

@login_required
def thematique(request):
    if not is_candidat(request.user):
        return redirect("error")  # Redirection vers la page d'erreur 404 pour les non-candidats
    else:
        #general info
        user_count = Electeur.objects.filter(Ville = request.user.candidat.Ville).count()
        proposition_count = Proposition.objects.filter(candidat_id = request.user.candidat.pk).count()
        
        # Obtention des propositions par thématiques
        all_purposes = Proposition.objects.filter(candidat_id=request.user.candidat.pk)

        # Calcul des informations de vote pour chaque proposition
        for purpose in all_purposes:
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

        # Afficher les informations triées
        for theme, purposes in grouped_purposes.items():
            for purpose in purposes:
                print(theme, purpose, purpose.ratio_votes_pour, purpose.num_votes_pour, purpose.num_votes_contre)

        return render(request, 'candidat/thematique.html', {
            'all_purposes' : grouped_purposes.items(),
            'Article_count' : Article.objects.filter(candidat_id = request.user.candidat.pk).count(),
            'proposition_count' : Proposition.objects.filter(candidat_id = request.user.candidat.pk).count(),
            'user_count' : user_count,
            'theme_count' : Themes_cles.objects.count(),
            'themes' : Themes_cles.objects.all(),
            'proposition_count' : proposition_count,
            })
    
def error(request):
    return (request, 'candidat/error.html')