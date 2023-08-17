from django.shortcuts import render
from django.contrib.auth.decorators import login_required


# Création des vues

@login_required
def actuality(request):
    return render(request, 'actuality.html', {'section':'actuality'})