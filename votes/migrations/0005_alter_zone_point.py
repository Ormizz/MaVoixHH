# Generated by Django 4.2.4 on 2023-08-21 21:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('votes', '0004_zone_point'),
    ]

    operations = [
        migrations.AlterField(
            model_name='zone',
            name='point',
            field=models.CharField(blank=True, max_length=500, null=True),
        ),
    ]
