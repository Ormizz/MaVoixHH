# Generated by Django 4.1.7 on 2023-08-21 18:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidat', '0010_candidat_sexe_alter_candidat_motivation'),
    ]

    operations = [
        migrations.AddField(
            model_name='candidat',
            name='fond',
            field=models.ImageField(blank=True, null=True, upload_to='imagesFondC/'),
        ),
        migrations.AddField(
            model_name='candidat',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='imagesPPC/'),
        ),
    ]
