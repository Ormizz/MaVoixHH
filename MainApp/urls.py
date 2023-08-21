from django.urls import path
from . import views


urlpatterns = [
    path('accueil', views.actuality, name='actuality'),
    path('', views.index, name='index'),
    path('proposition', views.propositionfunc, name='proposition'),
    path('Login', views.connexion,name='login'),
    path('SignUp', views.SignUp ,name='SignUp'),
    path('Logout', views.deconnexion,name='logout'),
    path('profileU', views.profileU,name='profileU'),
    path('profileU/editUser', views.editUser, name='edit-User'),
    path('image', views.enregistrer_photo,name='photo_test'),
    path('afficher_photos', views.afficher_photos,name='afficher_photos'),
]