"""
WSGI config for onlinerequest project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/howto/deployment/wsgi/
"""

import sys
sys.path.insert(1, '/home/data/html/onlinerequest/lib/python2.7/site-packages')
sys.path.append('/home/data/html/onlinerequest/lib/python2.7/site-packages/onlinerequest')


import os

from django.core.wsgi import get_wsgi_application


#os.environ.setdefault("DJANGO_SETTINGS_MODULE", "onlinerequest.settings")
os.environ["DJANGO_SETTINGS_MODULE"] = "onlinerequest.settings"
application = get_wsgi_application()
