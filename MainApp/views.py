import random
from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
import requests
from rest_framework import viewsets
from django.contrib.auth import authenticate, login, logout
from candidat.models import Article, Candidat

from MainApp.models import *
from votes.models import Proposition 
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
			return redirect("login")

	else:
		return render(request,'login.html')

def deconnexion(request):
	logout(request)
	return redirect("login")

def SignUp(request):
    if request.method == 'POST':
        user = User.objects.create_user(
            username = request.POST['username'], 
            email = request.POST['email'],
            password = request.POST['password'], 
        )
        user.save()
        electeur = Electeur.objects.create(
            nom = request.POST['nom'],
            prenoms = request.POST['prenoms'],
            date_naissance = request.POST['dateNais'],
            lieu_naissance = request.POST['lieuNais'],
            localisation = request.POST['localisation'],
            sexe = request.POST['sexe'],
            user_id = user.pk,
        )
        electeur.save()
        electeurGroup = Group.objects.get(name='Electeur')
        user.groups.add(electeurGroup)
        return redirect("login")
    return render(request, 'EleCreate.html')


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
    utilisateur = request.user
    return render(request, 'index.html', {
        'user': utilisateur, 
        'articles': actualite,
        'rdCandidat': random_candidat,
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