# Generated by Django 4.1.7 on 2023-08-19 00:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidat', '0004_candidat_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='date_creation',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
    ]
