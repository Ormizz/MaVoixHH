# Generated by Django 4.1.7 on 2023-08-17 18:04

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('MainApp', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='utilisateur',
            name='login',
        ),
        migrations.RemoveField(
            model_name='utilisateur',
            name='password',
        ),
        migrations.AddField(
            model_name='utilisateur',
            name='account',
            field=models.OneToOneField(default='', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
