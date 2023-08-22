from django.urls import path, include
from . import views
from rest_framework import routers
from rest_framework.routers import DefaultRouter

from votes.views import *

router = DefaultRouter()
router.register('Proposition', PropositionViewSet)
router.register('Vote', VoteViewSet)
router.register('Zone', ZoneViewSet)
router.register('Themes_cles', Themes_clesViewSet)

urlpatterns = [
    path('<int:id>', views.index, name='index'),
    path('resultat/<int:id>/<int:id2>/', views.resultat, name='resultat'),
    path('carte/', views.carte, name='carte'),
    path('api/', include(router.urls)),
]