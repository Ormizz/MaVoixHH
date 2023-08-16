from rest_framework import serializers

from candidat.models import *

class ArticleSerializer (serializers.ModelSerializer):
    
    class Meta:
        model = Article
        fields = '__all__'
        
class ElectionSerializer (serializers.ModelSerializer):
    
    class Meta:
        model = Election
        fields = '__all__'
        
class CandidatSerializer (serializers.ModelSerializer):
    
    class Meta:
        model = Candidat
        fields = '__all__'
        
        
class Question_electoralSerializer (serializers.ModelSerializer):
    
    class Meta:
        model = Question_electoral
        fields = '__all__'

class Proposition_electoralSerializer (serializers.ModelSerializer):
    
    class Meta:
        model = Proposition_electoral
        fields = '__all__'