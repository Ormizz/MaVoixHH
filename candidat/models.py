from django.db import models

# Creations des models pour candidat.
class Election(models.Model):
    id_election = models.AutoField(primary_key=True)
    libelle_election = models.CharField(max_length=50)
    description = models.CharField(max_length=100)
    date_debut = models.DateField()
    date_fin = models.DateField()
    
    def __str__(self):
        return f'Election:{self.id_election} {self.description}'
    
class Candidat(models.Model):
    id_candidat = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=50)
    prenoms = models.CharField(max_length=70)
    surnom = models.CharField(max_length=50)
    date_naissance = models.DateField()
    lieu_naissance = models.CharField(max_length=100)
    localisation = models.CharField(max_length=100)
    parti_politique = models.CharField(max_length=100)
    biographie = models.CharField(max_length=255)
    motivation = models.CharField(max_length=255)
    election = models.ForeignKey(Election, on_delete=models.CASCADE)
    
    def __str__(self):
        return f'Candidat:{self.id_candidat} {self.prenoms}'
    
class Question_electoral(models.Model):
    id_question_electoral = models.AutoField(primary_key=True)
    intitule_question = models.CharField(max_length=100)
    election = models.ForeignKey(Election, on_delete=models.CASCADE)
    
    def __str__(self):
        return f'Question_electoral:{self.id_question_electoral} {self.intitule_question}'
    
class Proposition_electoral(models.Model):
    id_proposition_electoral = models.AutoField(primary_key=True)
    reponse = models.CharField(max_length=100)
    question_electoral = models.ForeignKey(Question_electoral, on_delete=models.CASCADE)
    
    def __str__(self):
        return f'Proposition_electoral:{self.id_proposition_electoral} {self.reponse}'
    
class Article(models.Model):
    id_article = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=100)
    candidat = models.ForeignKey(Candidat, on_delete=models.CASCADE)
    
    def __str__(self):
        return f'Article:{self.id_article} {self.titre}'