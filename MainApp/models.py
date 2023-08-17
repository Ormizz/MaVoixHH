from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Electeur(models.Model):
    id_electeur = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50)
    prenoms = models.CharField(max_length=70)
    date_naissance = models.DateField()
    lieu_naissance = models.CharField(max_length=100)
    localisation = models.CharField(max_length=100)
    sexe = models.CharField(max_length=20)
    
    def __str__(self):
        return f'Electeur:{self.id_electeur} {self.nom}'
    
class Type_utilisateur(models.Model):
    id_type_utilisateur = models.AutoField(primary_key=True)
    libelle_type_utilisateur = models.CharField(max_length=50)
    
    def __str__(self):
        return f'Type_utilisateur:{self.id_type_utilisateur} {self.libelle_type_utilisateur}'
    
class Utilisateur (models.Model):
    id_utilisateur = models.AutoField(primary_key=True)
    account = models.OneToOneField(User, on_delete=models.CASCADE, default="")
    titulaire = models.IntegerField()
    type_utilisateur = models.ForeignKey(Type_utilisateur, on_delete=models.CASCADE)
    
    def __str__(self):
        return f'Utilisateur:{self.id_utilisateur} {self.account}'