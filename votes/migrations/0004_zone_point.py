# Generated by Django 4.2.4 on 2023-08-21 20:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('votes', '0003_alter_proposition_candidat_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='zone',
            name='point',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
