# Generated by Django 4.1.7 on 2023-08-23 17:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MainApp', '0006_alter_electeur_ville'),
    ]

    operations = [
        migrations.AddField(
            model_name='electeur',
            name='contact',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]