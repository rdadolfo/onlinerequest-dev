# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-08-03 05:54


from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('onlinerequest', '0010_auto_20170802_1105'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='itadmin',
            name='value',
        ),
        migrations.AlterField(
            model_name='issue',
            name='ap',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='IT', to=settings.AUTH_USER_MODEL),
        ),
        migrations.DeleteModel(
            name='Itadmin',
        ),
    ]
