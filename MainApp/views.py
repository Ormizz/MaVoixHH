import random
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
import requests
from rest_framework import viewsets
from django.contrib.auth import authenticate, login, logout
from candidat.models import Article, Candidat

from MainApp.models import *
from votes.models import Proposition, Zone
from MainApp.serializers import ElecteurSerialiser

from .forms import PhotoForm
from .models import Photo

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
    if request.method == 'POST':
        user = User.objects.create_user(
            username = request.POST['username'], 
            email = request.POST['email'],
            password = request.POST['password'], 
        )
        user.save()
        ville_id = request.POST['Ville']
        ville_instance = Ville.objects.get(pk=ville_id)
        electeur = Electeur.objects.create(
            nom = request.POST['nom'],
            prenoms = request.POST['prenoms'],
            date_naissance = request.POST['date_naissance'],
            lieu_naissance = request.POST['lieu_naissance'],
            sexe = request.POST['sexe'],
            user_id = user.pk,
            Ville_id = request.POST['Ville'],
        )
        electeur.save()
        electeurGroup = Group.objects.get(name='Electeur')
        user.groups.add(electeurGroup)
        return redirect("index")
    return render(request, 'accueil.html')


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

def enregistrer_photo(request):
    if request.method == 'POST':
        form = PhotoForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('afficher_photos')
    else:
        form = PhotoForm()
    return render(request, 'image.html', {'form': form})

def afficher_photos(request):
    photos = Photo.objects.all()
    return render(request, 'afficher_img.html', {'photos': photos})

def photo_test(request):
    return render(request,'image.html')

def carte(request):
       return render(request,'carte.html', {
            'candidats' : Candidat.objects.all(),
            'zone': Zone.objects.all()
    })

def get_candidats(request):
    zone = request.GET.get('zone')
    candidats = Candidat.objects.filter(Ville__libelle=zone).values('nom', 'prenoms', 'parti_politique', 'pk')
    return JsonResponse(list(candidats), safe=False)