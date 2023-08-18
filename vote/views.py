from django.shortcuts import render
import requests
import random
from collections import defaultdict
from rest_framework import viewsets
from vote.serializers import *
from candidat.models import *
from vote.models import *
from MainApp.models import *

# Create your views here.
def index(request, id):
     # Récupérez la zone spécifique et les thèmes associés
    zone = Zone.objects.get(pk=id)
    themes = Themes_cles.objects.filter(zone=zone.id_zone)
    
    # Calculez le nombre de réponses à obtenir par thème et par candidat
    total_themes = themes.count()
    total_candidats = Candidat.objects.count()
    reponses_par_candidat = 3 // total_candidats
    
    propositions = Proposition.objects.all()
    
    # Obtenez les réponses partagées de manière égale entre les candidats et les thèmes
    reponses = []

    ids_themes = [theme.id_themes_cles for theme in themes]
    
    # propositions_lies = Proposition.objects.filter(themes_cles__id_themes_cles__in=ids_themes)
    
    # propositions_liées = Proposition.objects.filter(themes_cles__id_themes_cles=themes)
    
    propositions_liees = []

    # Parcourez chaque thème et récupérez les propositions liées
    for theme in themes:
        propositions = Proposition.objects.filter(themes_cles=theme)
        propositions_liees.extend(propositions)
    

    propositions_par_candidat = defaultdict(list)
    resultat = []

    # Organisez les propositions par candidat
    for proposition in propositions_liees:
        id_candidat = proposition.candidat
        propositions_par_candidat[id_candidat].append(proposition)

    # Parcourez les propositions par candidat et sélectionnez aléatoirement jusqu'à deux propositions
    for id_candidat, propositions_candidat in propositions_par_candidat.items():
        propositions_choisies = random.sample(propositions_candidat, min(len(propositions_candidat), 2))
        resultat.extend(propositions_choisies)
        
    random.shuffle(resultat)
    nbr_proposition = len(resultat)
    

    return render(request,'sondages/index.html',{ 
        'reponses': resultat,
        'nbr': nbr_proposition
        })
    

def resultat(request, id):
    electeur = Electeur.objects.get(pk=id)
    candidat = Candidat.objects.all()
    vote = Vote.objects.filter(electeur=electeur.id_electeur)
    return render(request,'sondages/resultat.html',{ 
        'vote': vote
        })


class PropositionViewSet(viewsets.ModelViewSet):
    queryset = Proposition.objects.all()
    serializer_class = PropositionSerializer
    
class VoteViewSet(viewsets.ModelViewSet):
    queryset = Proposition.objects.all()
    serializer_class = VoteSerializer