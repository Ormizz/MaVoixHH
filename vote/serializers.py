from rest_framework import serializers
from vote.models import *

class PropositionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proposition
        fields = '__all__'
        
class VoteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vote
        fields = '__all__'
