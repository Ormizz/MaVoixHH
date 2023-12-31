# Generated by Django 4.1.7 on 2023-08-23 17:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('candidat', '0013_article_image'),
    ]

    operations = [
        migrations.CreateModel(
            name='Equipe',
            fields=[
                ('id_Equipier', models.AutoField(primary_key=True, serialize=False)),
                ('nomPrenom', models.CharField(max_length=100)),
                ('poste', models.TextField(default='un contenu', max_length=400)),
                ('image', models.ImageField(blank=True, null=True, upload_to='imagesEquipe/')),
                ('candidat', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='candidat.candidat')),
            ],
        ),
    ]
