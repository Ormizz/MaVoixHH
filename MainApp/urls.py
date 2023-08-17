from django.urls import path
from . import views
from django.contrib.auth import views as auth_views
from rest_framework import routers

from MainApp.views import *

url_patterns = [
    path('', views.actuality, name='actuality'),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),

]

router = routers.DefaultRouter()
router.register('User', UserViewSet, basename="User")
router.register('Electeur', ElecteurViewSet, basename="Electeur")
router.register('Utilisateur', UtilisateurViewSet, basename="Utilisateur")
router.register('Type_utilisateur', Type_utilisateurViewSet, basename="Type_utilisateur")