from django.urls import path
from . import views


urlpatterns = [
    path('', views.actuality, name='actuality'),
    path('Login', views.connexion,name='login'),
    path('SignUp', views.SignUp ,name='SignUp'),
    path('Logout', views.deconnexion,name='logout'),

]