"""onlinerequest URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.contrib.auth import views as auth_views

import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
	url(r'^$', views.index, name='index'),
	url(r'^accounts/login/$', auth_views.login, {'template_name': 'index.html'}, name='index'),
	url(r'^usrprf/(?P<u>[-\w]+)/$', views.usrprf, name='usrprf'),
#	url(r'^mylogin/$', views.mylogin, name='mylogin'),
	url(r'^mylogout/$', views.mylogout, name='logout'),
	url(r'^hlogout/$', views.hlogout, name='hlogout'),
	url(r'^update/(?P<u>[-\w]+)/(?P<i>[-\w]+)/$', views.update, name='update'),
	url(r'^hadmin/$', views.hadmin, name='hadmin'),
#	url(r'^helpdesk/$', views.helpdesk, name='helpdesk'),
	url(r'^helpdesk/(?P<u>[-\w]+)/$', views.helpdesk, name='helpdesk'),
	url(r'^status/(?P<issueid>[-\w]+)/$', views.status, name='status'),
	url(r'^astatus/(?P<u>[-\w]+)/(?P<i>[-\w]+)/$', views.astatus, name='astatus'),
	url(r'^close/(?P<issueid>[-\w]+)/$', views.close, name='close'),
	url(r'^archive/(?P<u>[-\w]+)/$', views.archive, name='archive'),
#	url(r'^profile/(?P<m>[-\w]+)/$', 'views.profile'),

]
