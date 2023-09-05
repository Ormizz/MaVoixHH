from django import forms
from django.contrib.auth.models import User
from .models import ImagesPUB

class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.ChoiceField(widget=forms.PasswordInput)
    


class PhotoForm(forms.ModelForm):
    class Meta:
        model = ImagesPUB  # Utilisez le modèle Photo
        fields = ['titre', 'image'] 
