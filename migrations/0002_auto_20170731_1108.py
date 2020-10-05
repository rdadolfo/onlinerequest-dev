# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-07-31 11:08
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('onlinerequest', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='issue',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
