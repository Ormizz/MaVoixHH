from django.urls import path
from . import views
from rest_framework import routers

from candidat.views import *

urlpatterns = [
    path('<int:id>', views.index, name='index'),
    path('listC', views.listC, name='listC'),
    path('form/<int:id>', views.formedit, name='formedit'),
    path('form/', views.form, name='form'),
    path('profile', views.profile, name='profileC'),
    path('profile/article', views.profileCreateArt, name='CreateArt'),
    path('profile/prop', views.profileCreateArt, name='CreateProp'),
    
]

router = routers.DefaultRouter()
router.register('Article', ArticleViewSet)
router.register('Election', ElectionViewSet)
router.register('Candidat', CandidatViewSet)
router.register('Question_electoral', Question_electoralViewSet)
router.register('Proposition_electoral', Proposition_electoralViewSet)