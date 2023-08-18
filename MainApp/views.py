from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
import requests
from rest_framework import viewsets
from django.contrib.auth import authenticate, login, logout

from MainApp.models import * 
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
    return render(request, 'accueil.html')
