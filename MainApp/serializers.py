from rest_framework import serializers
from django.contrib.auth.models import User
from MainApp.models import *

# class UtilisateurSerialiser(serializers.ModelSerializer):
    
#     class Meta:
#         model = Utilisateur
#         fields = '__all__'
        
class ElecteurSerialiser(serializers.ModelSerializer):
    
    class Meta:
        model = Electeur
        fields = '__all__'
        
# class Type_utilisateurSerialiser(serializers.ModelSerializer):
    
#     class Meta:
#         model = Type_utilisateur
#         fields = '__all__'

# class UserSerializer (serializers.ModelSerializer):

#     Utilisateur = UtilisateurSerialiser(source='utilisateur')
    
#     class Meta:
#         model = User
#         fields = ('id','username', 'email', 'date_joined', 'Utilisateur')