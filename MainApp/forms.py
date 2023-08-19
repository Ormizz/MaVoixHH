from django import forms
from django.contrib.auth.models import User
from .models import Photo

class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.ChoiceField(widget=forms.PasswordInput)
    


class PhotoForm(forms.ModelForm):
    class Meta:
        model = Photo
        fields = ('titre', 'image')
