from django.urls import path
from . import views


urlpatterns = [
    path('accueil', views.actuality, name='actuality'),
    path('', views.index, name='index'),
    path('login2', views.login2, name='login2'),
    path('proposition', views.propositionfunc, name='proposition'),
    path('Login', views.connexion,name='login'),
    path('SignUp', views.login2 ,name='SignUp'),
    path('Logout', views.deconnexion,name='logout'),
    path('profileU', views.profileU,name='profileU'),
    path('profileU/editUser', views.editUser, name='edit-User'),
    path('image', views.enregistrer_photo,name='photo_test'),
    path('carte', views.carte ,name='carteC'),
    path('afficher_photos', views.afficher_photos,name='afficher_photos'),
    path('get_candidats/', views.get_candidats, name='get_candidats'),
]