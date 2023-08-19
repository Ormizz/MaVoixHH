from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
from django.contrib.auth import authenticate, login, logout
import requests
from rest_framework import viewsets

from candidat.models import *
from candidat.serializers import *
from votes.models import Proposition, Themes_cles


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
def index(request, id):
    return render(request,'candidat/Candidat.html',{
        'candidat': Candidat.objects.get(pk=id),
        'articles': Article.objects.all()
    })

def listC(request):
    # URL de l'API Django
    api_url = "http://127.0.0.1:8000/crud/Candidat/"

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
    
    # api_find = 'http://127.0.0.1:8000/crud/Candidat/'+ str(candidat_id)
    
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
    api_get_candadat = "http://127.0.0.1:8000/crud/Candidat/"+str(id)
    return render(request, 'candidat/form.html')

@login_required  
def profile(request):
    # Récupérer le nom du groupe du candidat
    # user_group = request
    utilisateur = request.user
    actualite = Article.objects.filter(candidat=utilisateur.candidat.pk)
    all_theme = Themes_cles.objects.all()
    propositions = Proposition.objects.filter(candidat=utilisateur.candidat.pk)
    # print(actualite)
    if (str(request.user.groups.first())=="Candidat"):
        return render(request, 'candidat/profile.html',{
            'user':utilisateur,
            'actualites':actualite,
            'propositions':propositions,
            'all_theme':all_theme,
        })
    return render(request, 'candidat/Candidat.html')
    
@login_required  
def profileCreateArt(request):
    # Récupérer le nom du groupe du candidat
    # user_group = request
    if request.method == 'POST':
        actu = Article.objects.create(
            titre = request.POST['content'], 
            content = request.POST['content'],
            candidat_id = request.user.candidat.pk,
        )
        actu.save()
        return redirect("profileC")
    return render(request, 'candidat/profile.html')
    