# Generated by Django 4.2.4 on 2023-08-21 23:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('candidat', '0011_candidat_fond_candidat_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='ville',
            name='point',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
    ]
