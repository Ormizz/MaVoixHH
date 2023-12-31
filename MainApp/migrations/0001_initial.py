# Generated by Django 4.2.4 on 2023-08-17 16:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Electeur',
            fields=[
                ('id_electeur', models.AutoField(primary_key=True, serialize=False)),
                ('nom', models.CharField(max_length=50)),
                ('prenoms', models.CharField(max_length=70)),
                ('date_naissance', models.DateField()),
                ('lieu_naissance', models.CharField(max_length=100)),
                ('localisation', models.CharField(max_length=100)),
                ('sexe', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Type_utilisateur',
            fields=[
                ('id_type_utilisateur', models.AutoField(primary_key=True, serialize=False)),
                ('libelle_type_utilisateur', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Utilisateur',
            fields=[
                ('id_utilisateur', models.AutoField(primary_key=True, serialize=False)),
                ('login', models.CharField(max_length=50)),
                ('password', models.CharField(max_length=70)),
                ('titulaire', models.IntegerField()),
                ('type_utilisateur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='MainApp.type_utilisateur')),
            ],
        ),
    ]
