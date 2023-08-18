from django.urls import path
from . import views


urlpatterns = [
    # path('', views.actuality, name='actuality'),
    # path('CandidatList', views.CandidatList,name='CandList'),
    # path('ArticleList', views.ArticleList ,name='SignUp'),
    path('Resultat', views.Resultat,name='Resultat'),
]