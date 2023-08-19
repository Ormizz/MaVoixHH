from rest_framework import serializers
from votes.models import *

class PropositionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proposition
        fields = '__all__'
        
class VoteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vote
        fields = '__all__'
        
class ZoneSerializer(serializers.ModelSerializer):
    class Meta:
        model = Zone
        fields = '__all__'
        
class Themes_clesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Themes_cles
        fields = '__all__'
