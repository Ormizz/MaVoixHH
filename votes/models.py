
# Create your models here.
from django.db import models
from candidat.models import Candidat
from MainApp.models import Electeur


# Create your models here.
class Zone(models.Model):
    id_zone = models.AutoField(primary_key=True)
    nom_zone = models.CharField(max_length=100)
    
    def __str__(self):
        return f'Zone:{self.id_zone} {self.nom_zone}'
    
class Themes_cles(models.Model):
    id_themes_cles = models.AutoField(primary_key=True)
    libelle_themes_cles = models.CharField(max_length=100)
    
    def __str__(self):
        return f'Themes_cles:{self.id_themes_cles} {self.libelle_themes_cles}'
    
class Proposition(models.Model):
    id_proposition = models.AutoField(primary_key=True)
    libelle_proposition = models.CharField(max_length=150)
    candidat = models.ForeignKey(Candidat, on_delete=models.CASCADE, blank=True,null=True)
    date_creation = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    themes_cles = models.ForeignKey(Themes_cles, on_delete=models.CASCADE, blank=True,null=True)
    zone = models.ForeignKey(Zone, on_delete=models.CASCADE,blank=True,null=True)
    
    def __str__(self):
        return f'Proposition:{self.id_proposition} {self.libelle_proposition}'
    
class Vote(models.Model):
    id_Vote = models.AutoField(primary_key=True)
    nature_vote = models.CharField(max_length=70)
    proposition = models.ForeignKey(Proposition, on_delete=models.CASCADE, blank=True,null=True)
    zone = models.ForeignKey(Zone, on_delete=models.CASCADE, blank=True,null=True)
    electeur = models.ForeignKey(Electeur, on_delete=models.CASCADE, blank=True,null=True)
    candidat = models.ForeignKey(Candidat, on_delete=models.CASCADE, blank=True,null=True)
    
    def __str__(self):
        return f'Vote:{self.id_Vote} {self.nature_vote}'