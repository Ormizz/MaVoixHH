from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from MainApp.models import Utilisateur
# Register your models here.


class UtilisateurInline(admin.StackedInline):
    model = Utilisateur
    
class UserAdmin(UserAdmin):
    inlines= (Utilisateur,)
    
admin.site.unregister(User)
admin.site.register(User) 

@admin.register(Utilisateur)
class GenericAdmin(admin.ModelAdmin):
    pass