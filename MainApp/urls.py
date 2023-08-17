from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

url_patterns = [
    path('', views.actuality, name='actuality'),
    path('', views.actuality, name='actuality'),
    
]