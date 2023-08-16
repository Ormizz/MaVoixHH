from django.urls import path
from . import views
from rest_framework import routers

from candidat.views import *

urlpatterns = [
    path('', views.index, name='index'),
    path('listC', views.listC, name='listC'),
    path('form/<int:id>', views.formedit, name='formedit'),
    path('form/', views.form, name='form'),
    
]

router = routers.DefaultRouter()
router.register('Article', ArticleViewSet)
router.register('Election', ElectionViewSet)
router.register('Candidat', CandidatViewSet)
router.register('Question_electoral', Question_electoralViewSet)
router.register('Proposition_electoral', Proposition_electoralViewSet)