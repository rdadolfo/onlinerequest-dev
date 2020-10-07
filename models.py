# -*- coding: utf-8 -*-


from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Issuetype(models.Model):
	value = models.TextField(max_length=20, null=False)

class Status(models.Model):
	value = models.CharField(max_length=20, null=False)

class Issue(models.Model):
	user = models.ForeignKey(User)
	date_entry = models.DateTimeField(auto_now_add=True)
	date_closed = models.DateTimeField(null=True, blank=True)
	date_assign = models.DateTimeField(null=True, blank=True)
	issue_type = models.ForeignKey(Issuetype, null=False, blank=False)
	issue_desc = models.TextField(max_length=500, null=True, blank=True)
#	remarks = models.TextField(max_length=500, null=True, blank=True)	
	status = models.ForeignKey(Status)
	ap = models.ForeignKey(User, null=True, blank=True, related_name="IT")

class TransactionLog(models.Model):
	issue = models.ForeignKey(Issue)
	user = models.ForeignKey(User)
	date = models.DateTimeField(auto_now_add=True)
	issue_desc = models.TextField(max_length=500, null=True, blank=True)
	updates = models.TextField(max_length=500, null=True, blank=True)
