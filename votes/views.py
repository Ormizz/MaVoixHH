from django.shortcuts import render
from django.db.models import Count
import requests
import random
from collections import defaultdict
from rest_framework import viewsets
from votes.serializers import *
from candidat.models import *
from votes.models import *
from MainApp.models import *
from django.db.models import Count, Q
from django.db.models import OuterRef, Subquery
from django.db.models import Max, F, Subquery
from django.db.models.functions import Coalesce
from django.shortcuts import get_object_or_404


# Create your views here.
def index(request, id):
    # Récupérez la zone spécifique et les thèmes associés
    zone = Ville.objects.get(pk=id)
    themes = Themes_cles.objects.all()
    
    # Calculez le nombre de réponses à obtenir par thème et par candidat
    # total_themes = themes.count()
    total_candidats = Candidat.objects.count()
    reponses_par_candidat = 25 // total_candidats
    
    # propositions = Proposition.objects.all()
    
    # Obtenez les réponses partagées de manière égale entre les candidats et les thèmes
    reponses = []

    # ids_themes = [theme.id_themes_cles for theme in themes]
    
    # propositions_lies = Proposition.objects.filter(themes_cles__id_themes_cles__in=ids_themes)
    
    # propositions_liées = Proposition.objects.filter(themes_cles__id_themes_cles=themes)
    
    propositions_liees = []

    # Parcourez chaque thème et récupérez les propositions liées
    for theme in themes:
        propositions = Proposition.objects.filter(themes_cles=theme, ville=zone.id_Ville)
        propositions_liees.extend(propositions)
    

    propositions_par_candidat = defaultdict(list)
    resultat = []

    # Organisez les propositions par candidat
    for proposition in propositions_liees:
        id_candidat = proposition.candidat
        propositions_par_candidat[id_candidat].append(proposition)

    # Parcourez les propositions par candidat et sélectionnez aléatoirement jusqu'à deux propositions
    for id_candidat, propositions_candidat in propositions_par_candidat.items():
        propositions_choisies = random.sample(propositions_candidat, min(len(propositions_candidat), reponses_par_candidat))
        resultat.extend(propositions_choisies)
        
    random.shuffle(resultat)
    nbr_proposition = len(resultat)
    electeur = Electeur.objects.get(user=request.user.id)
    zones = Ville.objects.all().order_by('libelle')
    return render(request,'sondages/index.html',{ 
        'reponses': resultat,
        'nbr': nbr_proposition,
        'zone': zone,
        'zones': zones,
        'electeur': electeur,
        'user': request.user
        })
    

def resultat(request, id, id2):
    electeur = Electeur.objects.get(pk=id)
    candidat = Candidat.objects.all()
    vote = Vote.objects.filter(electeur=electeur.id_electeur)
    
    ville_id = id2     
    candidats = Candidat.objects.filter(Ville__id_Ville=ville_id)

    # Liste pour stocker les résultats par candidat
    resultats_par_candidat = []

    # Parcours de tous les candidats
    for candidat in candidats:
        candidat_id = candidat.id_candidat
        
        # Obtenez le nombre de votes "pour" par zone pour le candidat spécifié
        resultats = Vote.objects.filter(candidat_id=candidat_id, nature_vote='pour').values('ville').annotate(nombre_votes_pour=Count('nature_vote'))

        # Stockez les résultats pour ce candidat dans le dictionnaire
        resultat_candidat = {
            'candidat': f"{candidat.nom} {candidat.prenoms}",
            'resultats': [
                {'zone': resultat['ville'], 'nombre_votes_pour': resultat['nombre_votes_pour']}
                for resultat in resultats
            ]
        }
        
    electeur_id = id  # Remplacez par l'ID de l'électeur souhaité

    candidats_avec_votes_pour = Candidat.objects.filter(
        vote__electeur_id=electeur_id, vote__nature_vote='pour', Ville__id_Ville=ville_id
    ).annotate(num_votes_pour=Count('vote')).order_by('-num_votes_pour')
    premier_candidat = candidats_avec_votes_pour.first()
    deuxieme_candidat = candidats_avec_votes_pour[1] if len(candidats) >= 2 else None
    troisieme_candidat = candidats_avec_votes_pour[2] if len(candidats) >= 3 else None
    
    nbr_total_vote = 0
    for cvpe in candidats_avec_votes_pour:
        nbr_total_vote = nbr_total_vote + cvpe.num_votes_pour
        
    
    # Ajoutez le dictionnaire des résultats au liste
    resultats_par_candidat.append(resultat_candidat)
    return render(request,'sondages/resultat.html',{ 
        'vote': candidats_avec_votes_pour,
        'premier_candidat': premier_candidat,
        'deuxieme_candidat': deuxieme_candidat,
        'troisieme_candidat': troisieme_candidat,
        'nbr_total_vote': nbr_total_vote,
        'candidats': candidats
        })


class PropositionViewSet(viewsets.ModelViewSet):
    queryset = Proposition.objects.all()
    serializer_class = PropositionSerializer
    
class VoteViewSet(viewsets.ModelViewSet):
    queryset = Vote.objects.all()
    serializer_class = VoteSerializer
    
class ZoneViewSet(viewsets.ModelViewSet):
    queryset = Zone.objects.all()
    serializer_class = ZoneSerializer
    
class Themes_clesViewSet(viewsets.ModelViewSet):
    queryset = Themes_cles.objects.all()
    serializer_class = Themes_clesSerializer
    
def carte(request): 
    
    candidats_avec_votes_pour = Candidat.objects.filter(
        vote__nature_vote='pour'
    ).annotate(num_votes_pour=Count('vote')).order_by('-num_votes_pour')
    
    return render(request,'sondages/carte.html', {
        'zone': Ville.objects.all(),
        'candidats': candidats_avec_votes_pour
    })
    
def detail(request, id):
    electeur = request.user.electeur
    
    votes_pour = Vote.objects.filter(electeur=electeur.id_electeur, candidat=id)
    
    return render(request,'sondages/detail.html', {
        'votes': votes_pour
    })
