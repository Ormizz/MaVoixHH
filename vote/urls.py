from django.urls import path, include
from . import views
from rest_framework import routers
from rest_framework.routers import DefaultRouter

from vote.views import *

router = DefaultRouter()
router.register('Proposition', PropositionViewSet)
router.register('Vote', VoteViewSet)

urlpatterns = [
    path('<int:id>', views.index, name='index'),
    path('resultat/<int:id>', views.resultat, name='resultat'),
    path('api/', include(router.urls)),
]