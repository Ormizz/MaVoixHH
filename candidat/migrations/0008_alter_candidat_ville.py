# Generated by Django 4.1.7 on 2023-08-21 16:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('candidat', '0007_remove_candidat_localisation_candidat_ville'),
    ]

    operations = [
        migrations.AlterField(
            model_name='candidat',
            name='Ville',
            field=models.ForeignKey(blank=True, default='', null=True, on_delete=django.db.models.deletion.SET_NULL, to='candidat.ville'),
        ),
    ]
