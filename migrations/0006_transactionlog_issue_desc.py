# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-08-02 08:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('onlinerequest', '0005_auto_20170802_0759'),
    ]

    operations = [
        migrations.AddField(
            model_name='transactionlog',
            name='issue_desc',
            field=models.TextField(blank=True, max_length=500, null=True),
        ),
    ]