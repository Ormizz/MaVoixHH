# Generated by Django 4.2.4 on 2023-08-21 21:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('votes', '0005_alter_zone_point'),
    ]

    operations = [
        migrations.AlterField(
            model_name='zone',
            name='point',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
    ]