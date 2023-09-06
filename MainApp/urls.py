from django.urls import path
from . import views


urlpatterns = [
    path('accueil', views.actuality, name='actuality'),
    path('pub', views.pub, name='pub'),
    path('', views.index, name='index'),
    path('login2', views.login2, name='login2'),
    path('proposition', views.propositionfunc, name='proposition'),
    path('Login', views.connexion,name='login'),
    path('SignUp', views.SignUp ,name='SignUp'),
    path('Logout', views.deconnexion,name='logout'),
    path('profileU', views.profileU,name='profileU'),
    path('profileU/editUser', views.editUser, name='edit-User'),
    path('carte', views.carte ,name='carteC'),
    path('get_candidats/', views.get_candidats, name='get_candidats'),
    path('listCandidat/<int:id>', views.listCandidat, name='listCandidat'),
    path('analytic/<int:id>', views.analytic, name='analytic'),
    path('G_electeur', views.G_electeur, name='G_electeur'),
    path('G_candidat', views.G_candidat, name='G_candidat'),
    path('notificationSend', views.notificationSend, name='notificationSend'),
    path('G_notifications', views.G_notifications, name='G_notifications'),
    path('CreateCand', views.CreateCand, name='CreateCand'),
    path('deleteCand/<int:id>', views.DeleteCand, name='deleteCand'),
    path('deleteElec/<int:id>', views.DeleteElec, name='deleteElec'),
    path('message', views.messagesend, name='message'),
    path('404', views.error, name='error'),
]