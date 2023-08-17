from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
import requests
from rest_framework import viewsets

from MainApp.models import * 
from MainApp.serializers import UserSerializer,ElecteurSerialiser,Type_utilisateurSerialiser,UtilisateurSerialiser

# Création des vues

class UserViewSet(viewsets.ModelViewSet):
    
    queryset = User.objects.all()
    serializer_class = UserSerializer
    
class ElecteurViewSet(viewsets.ModelViewSet):
    
    queryset = Electeur.objects.all()
    serializer_class = ElecteurSerialiser
    
class Type_utilisateurViewSet(viewsets.ModelViewSet):
    
    queryset = Type_utilisateur.objects.all()
    serializer_class = Type_utilisateurSerialiser
    
class UtilisateurViewSet(viewsets.ModelViewSet):
    
    queryset = Utilisateur.objects.all()
    serializer_class = UtilisateurSerialiser
    


@login_required
def actuality(request):
    return render(request, 'actuality.html', {'section':'actuality'})