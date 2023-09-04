from django.urls import path, include
from . import views
from rest_framework import routers

from candidat.views import *

urlpatterns = [
    path('<int:id>', views.index, name='index'),
    path('form/<int:id>', views.formedit, name='formedit'),
    path('form/', views.form, name='form'),
    path('profile', views.profile, name='profileC'),
    path('profile/article', views.profileCreateArt, name='CreateArt'),
    path('profile/prop', views.profileCreateProp, name='CreateProp'),
    path('profile/membre', views.profileCreateEquipe, name='CreateEquipe'),
    path('profile/editarticle/<int:id>', views.profileModifArt, name='editArt'),
    path('profile/editproposition/<int:id>', views.profileModifProp, name='editProp'),
    path('profile/editequipe/<int:id>', views.profileModifEquipe, name='editEquipe'),
    path('profile/editcandidat', views.editcandidat, name='edit-candidat'),
    path('profile/deleteroposition/<int:id>', views.profileDeleteProp, name='deleteProp'),
    path('profile/deletearticle/<int:id>', views.profileDeleteArticle, name='deleteArt'),
    path('profile/deleteequipe/<int:id>', views.profileDeleteEquipe, name='deleteEquipe'),
    path('profile/thematique', views.thematique, name='thematique'),
    path('MainApp/', include('MainApp.urls'))
]


router = routers.DefaultRouter()
router.register('Article', ArticleViewSet)
router.register('Election', ElectionViewSet)
router.register('Candidat', CandidatViewSet)
router.register('Question_electoral', Question_electoralViewSet)
router.register('Proposition_electoral', Proposition_electoralViewSet)