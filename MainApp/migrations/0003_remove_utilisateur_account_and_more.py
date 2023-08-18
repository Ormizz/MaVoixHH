# Generated by Django 4.1.7 on 2023-08-18 00:41

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('MainApp', '0002_remove_utilisateur_login_remove_utilisateur_password_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='utilisateur',
            name='account',
        ),
        migrations.RemoveField(
            model_name='utilisateur',
            name='type_utilisateur',
        ),
        migrations.AddField(
            model_name='electeur',
            name='user',
            field=models.OneToOneField(blank=True, default='', null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='electeur',
            name='lieu_naissance',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.DeleteModel(
            name='Type_utilisateur',
        ),
        migrations.DeleteModel(
            name='Utilisateur',
        ),
    ]
