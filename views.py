# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, render_to_response, redirect
from django.http import HttpResponse, HttpResponseRedirect, HttpResponseForbidden
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User
from django.template import RequestContext
from onlinerequest.models import *
from django.utils import timezone

# Create your views here.
#@login_required
def index(request):
	if request.method == 'POST':
		username = request.POST['username']
		password = request.POST['password']
		u = authenticate(username=username, password=password)
		if u is not None:
			if u.is_active:
				request.session.set_expiry(0)
				login(request, u)
				return HttpResponseRedirect("/usrprf/%s" %(u.id))
			else:
				return HttpResponse("Account is inactive")
		else:
			return HttpResponse("Your username and password were incorrect")
	context=None
	return render(request, 'index.html', {}, content_type='text/html')

@login_required
def usrprf(request, u):
	d=User.objects.get(id=u)
	if d == request.user or d in User.objects.filter(is_superuser=True):
		s = Issuetype.objects.all()
		x = Issue.objects.all().filter(user_id=u,status_id=1).select_related().order_by('date_entry')
		n = Status.objects.all()
		c = Issue.objects.all().filter(user_id=u,status_id=2).select_related().order_by('-date_closed')
		if request.method == 'POST':
			issuetype=request.POST['issuetype']
			message=request.POST['message']
			m="<<<<<< Please fillup request"
			iss="<<<<<< Please select category"
			if message == "" and issuetype == "default":
				return render(request, 'usrprf.html', {'d':d, 's':s, 'x':x, 'n':n, 'c':c, 'm':m, 'iss':iss}, content_type='text/html')
			elif message == "" and issuetype != "default":
				return render(request, 'usrprf.html', {'d':d, 's':s, 'x':x, 'n':n, 'c':c, 'm':m }, content_type='text/html')
			elif message != "" and issuetype == "default":
				return render(request, 'usrprf.html', {'d':d, 's':s, 'x':x, 'n':n, 'c':c, 'iss':iss }, content_type='text/html')
			else:
				o=Issuetype.objects.get(id=issuetype)
				user=User.objects.get(id=u)
				Issue.objects.create(user_id=user.id, issue_type_id=issuetype, issue_desc=message, status_id=1)
				return HttpResponseRedirect("/usrprf/%s" %(u))
	else:
		return HttpResponseForbidden()

	return render(request, 'usrprf.html', {'d':d, 's':s, 'x':x, 'n':n, 'c':c}, content_type='text/html')


@login_required
def status(request, issueid):
	issue_id=Issue.objects.all().filter(id=issueid).select_related()
	for i in issue_id:
		d=User.objects.get(id=i.user_id)
	if d == request.user:
		issue=TransactionLog.objects.all().filter(issue_id=issueid).select_related()
		if Issue.objects.all().filter(id=issueid).filter(ap_id__isnull=False, date_closed__isnull=True):
			ap=Issue.objects.all().filter(id=issueid).filter(ap_id__isnull=False, date_closed__isnull=True).select_related()
			o=User.objects.get(id=(Issue.objects.get(id=issueid).ap_id))
			m="Close Ticket"
			return render(request, 'status.html', {'issue':issue, 'ap':ap, 'o':o, 'issueid':issueid, 'm':m }, content_type='text/html')

		elif Issue.objects.all().filter(id=issueid).filter(ap_id__isnull=True, date_closed__isnull=True):
			return HttpResponse("Ticket to be assign")

		else:
			c=Issue.objects.all().filter(id=issueid).filter(ap_id__isnull=False, date_closed__isnull=False).select_related()
			o=User.objects.get(id=(Issue.objects.get(id=issueid).ap_id))
			ap=c
			m=""
			return render(request, 'status.html', {'issue':issue, 'ap':ap, 'o':o, 'issueid':issueid, 'm':m, 'c':c}, content_type='text/html')

	else:
		return HttpResponseForbidden()

@login_required
def close(request, issueid):
	import datetime
	if Issue.objects.all().filter(id=issueid, date_closed__isnull=False):
		return HttpResponse("Ticket already closed")

	else:
#	issueid=Issue.objects.get(id=issueid)
		k=Issue.objects.all().filter(id=issueid)
		k.update(date_closed=datetime.datetime.now(), status_id=2)
#	return HttpResponse("%s" %(issueid.id))
		for l in k:
			s=l.user_id
		TransactionLog.objects.create(issue_id=issueid,updates="Ticket closed", user_id=s)

		return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
#		return HttpResponseRedirect("/usrprf/%s" %(s))

#@login_required
def hadmin(request):
	if request.method == 'POST':
		username = request.POST['username']
		password = request.POST['password']
		u = authenticate(username=username, password=password)
		if u is not None and u.is_active and u.is_superuser:
			request.session.set_expiry(0)
			login(request, u)
			return HttpResponseRedirect("/helpdesk/%s" %(u.id))
		else:
			return HttpResponse("Access Denied")

	return render(request, 'hadmin.html', {}, content_type='text/html')
	
def helpdesk(request, u):
	user=User.objects.get(id=u)
	if user == request.user and user in User.objects.filter(is_superuser=True):
		import datetime
		if request.method == 'POST':
			if 'itadmin' in request.POST:
				itadmin=request.POST['itadmin']
				if itadmin == 'default':
					return HttpResponse("Please select Assigned to")
			else:
				return HttpResponse("Please select Assigned to Personnel")
	
			if 'issueid' in request.POST:
				issueid=request.POST.getlist('issueid')
			else:
				return HttpResponse("Select Ticket No.")
			n=[]
			for i in range(0, len(issueid)):
				Issue.objects.filter(id=issueid[i]).update(ap_id=itadmin, date_assign=datetime.datetime.now())
				n=n+[Issue.objects.get(id=issueid[i])]
			for r in n:
				TransactionLog.objects.create(issue_id=r.id, issue_desc=r.issue_desc, updates="Assign Ticket", user_id=r.user_id)
		a=User.objects.filter(is_superuser=True)
		l=Issue.objects.all().filter(ap_id__isnull=True).select_related()
		m=Issue.objects.all().filter(ap_id__isnull=False).filter(date_closed__isnull=True).select_related()
		return render(request, 'helpdesk.html', {'l':l, 'a':a, 'u':u, 'm':m, 'user':user}, content_type='text/html')
	else:
		return HttpResponse("Access Denied")

def update(request, u, i):
	user=User.objects.get(id=u)
	if user == request.user and user in User.objects.filter(is_superuser=True):
#		issue_id=Issue.objects.all().filter(id=i).select_related()
#		for i in issue_id:
#			d=User.objects.get(id=i.ap_id)
#		if d in User.objects.filter(is_superuser=True):
		x=TransactionLog.objects.all().filter(issue_id=i).select_related()
		n=Issue.objects.filter(id=i)
#		for z in n: 
#			t=z
		for f in x:
			o=f
		if request.method == 'POST':
			if 'message' in request.POST:
				message=request.POST['message']
				TransactionLog.objects.create(updates=message, issue_desc=o.issue_desc, issue_id=o.issue_id, user_id=o.user_id)
			else:
				message=False
			return HttpResponseRedirect('/update/%s/%s' %(u,i))
		return render(request, 'update.html', {'o':o, 'u':u, 'i':i, 'x':x}, content_type='text/html')

#		return HttpResponse("Valid")

	else:
		return HttpResponse("Invalid")

def archive(request, u):
	user=User.objects.get(id=u)
	if user == request.user and user in User.objects.filter(is_superuser=True):
		s=Issue.objects.all().filter(date_closed__isnull=False)
		return render(request, 'archive.html', {'s':s, 'u':u}, content_type='text/html')
	else:
		return HttpResponse("Invalid User")

def astatus(request, u, i):
	user=User.objects.get(id=u)
	if user == request.user and user in User.objects.filter(is_superuser=True):
		issueid=Issue.objects.all().filter(id=i, date_closed__isnull=False).select_related()
		for l in issueid:
			userid=l.user_id
		issue=TransactionLog.objects.filter(issue_id=issueid).select_related()
		return render(request, 'astatus.html', {'i':i, 'u':u, 'issueid':issueid, 'issue':issue, 'userid':userid}, content_type='text/html')
	else:
		return HttpResponseForbidden()


def hlogout(request):
	logout(request)
	return HttpResponseRedirect('/hadmin/')

def mylogout(request):
	logout(request)
	return HttpResponseRedirect('/')
