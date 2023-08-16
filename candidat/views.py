import re
from django.shortcuts import render
import requests
from rest_framework import viewsets

from candidat.models import *
from candidat.serializers import *


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
    
# Create your views here.
def index(request):
    return render(request,'candidat/index.html')

def listC(request):
    # URL de l'API Django
    api_url = "http://127.0.0.1:8000/crudCandidat/Candidat/"

    #utilisation de la requête
    
    response = requests.get(api_url)
    
    if response.status_code == 200:
        candidats = response.json()
        context = {'candidats': candidats}
        return render(request, 'candidat/listC.html', context)
    else:
        return render(request, 'error_template.html')

def form(request):
    # Récupérer l'URL en cours
    # current_url = request.build_absolute_uri()
    
    # # Utiliser une expression régulière pour extraire l'ID de l'URL
    # match = re.search(r'/candidats/(\d+)/', current_url)
    # candidat_id = match.group(1) if match else None
    
    # #Trouver l'utilisateur
    
    # api_find = 'http://127.0.0.1:8000/crudCandidat/Candidat/'+ str(candidat_id)
    
    # findCandidat = requests.get(api_find)
    # if findCandidat.status_code == 200:
    #     candidat = findCandidat.json()
    #     return render(request, 'candidat/form.html', candidat)
    return render(request, 'candidat/form.html')
        
    #reconduction des pages
    
    if candidat_id:
        return render(request, 'candidat/form.html', context)
    
def formedit(request, id):
    # Récupérer l'id du candidat
    api_get_candadat = "http://127.0.0.1:8000/crudCandidat/Candidat/"+str(id)
    return render(request, 'candidat/form.html')
        
    