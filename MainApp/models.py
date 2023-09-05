from django.db import models
from django.contrib.auth.models import User
from candidat.models import Ville

# Create your models here.
class Electeur(models.Model):
    id_electeur = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50)
    prenoms = models.CharField(max_length=70)
    date_naissance = models.DateField()
    lieu_naissance = models.CharField(max_length=100, blank=True, null=True)
    contact = models.CharField(max_length=100, blank=True, null=True)
    Ville = models.ForeignKey(Ville, on_delete=models.SET_NULL, default="", null=True, blank=True)
    sexe = models.CharField(max_length=20)
    user = models.OneToOneField(User, on_delete=models.SET_NULL, default="", null=True, blank=True)
    
    def __str__(self):
        return f'Electeur:{self.id_electeur} {self.nom}'
    
class Photo(models.Model):
    titre = models.CharField(max_length=100)
    image = models.ImageField(upload_to='images/')

    def __str__(self):
        return self.titre
    
class ImagesPUB(models.Model):
    titre = models.CharField(max_length=255)  # Un champ pour le titre de la photo
    image = models.ImageField(upload_to='imagesPUB/')  # Un champ pour l'image, 'upload_to' spécifie le répertoire de stockage

    def __str__(self):
        return self.titre

    
# class Type_utilisateur(models.Model):
#     id_type_utilisateur = models.AutoField(primary_key=True)
#     libelle_type_utilisateur = models.CharField(max_length=50)
    
#     def __str__(self):
#         return f'Type_utilisateur:{self.id_type_utilisateur} {self.libelle_type_utilisateur}'
    
# class Utilisateur (models.Model):
#     id_utilisateur = models.AutoField(primary_key=True)
#     account = models.OneToOneField(User, on_delete=models.CASCADE, default="")
#     titulaire = models.IntegerField()
#     type_utilisateur = models.ForeignKey(Type_utilisateur, on_delete=models.CASCADE)
    
#     def __str__(self):
#         return f'Utilisateur:{self.id_utilisateur} {self.account}'