from django.shortcuts import render

# Create your views here.

def Resultat(request):
    return render(request, 'index.html')