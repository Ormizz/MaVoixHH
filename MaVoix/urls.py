"""MaVoix URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from django.conf import settings
from django.conf.urls.static import static
from candidat.urls import router as candidatRouter

router = routers.DefaultRouter()
router.registry.extend(candidatRouter.registry)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('candidat/', include('candidat.urls')),
    path('', include('MainApp.urls')),
    path('crud/', include(router.urls)),
    path('vote/', include('votes.urls')),
    path('AdminDash/', include('DashAdmin.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)