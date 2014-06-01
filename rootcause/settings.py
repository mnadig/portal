"""
Django settings for rootcause project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'am1z6gj0qk0wy_q#0@5m7+_dutsd%4kcxv+)xvd3zwy=la+0uw'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    'django.contrib.humanize',
    'forms_builder.forms',
    'snapp',
    'registration',
    'bootstrap3',
)

# for registration app
ACCOUNT_ACTIVATION_DAYS=7
SENDGRID_EMAIL_BACKEND = "sendgrid.backends.SendGridEmailBackend"
EMAIL_BACKEND = SENDGRID_EMAIL_BACKEND
SENDGRID_EMAIL_HOST='smtp.sendgrid.net'
SENDGRID_EMAIL_PORT =587
SENDGRID_EMAIL_USERNAME = os.environ.get('ROOTCAUSE_SENDGRID_USERNAME') #export ROOTCAUSE_SENDGRID_USERNAME='rootcause'
SENDGRID_EMAIL_PASSWORD = os.environ.get('ROOTCAUSE_SENDGRID_PASSWORD') #export ROOTCAUSE_SENDGRID_PASSWORD='r00t@Caus3'
DEFAULT_FROM_EMAIL='socialinnovationforum@rootcause.org'

TEMPLATE_CONTEXT_PROCESSORS = (
    # other context processors
    "django.core.context_processors.request",
    # Django 1.6 also needs:
    'django.contrib.auth.context_processors.auth',
)

SITE_ID = 1

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    "django.contrib.staticfiles.finders.FileSystemFinder",
    "django.contrib.staticfiles.finders.AppDirectoriesFinder",
)

ROOT_URLCONF = 'rootcause.urls'

WSGI_APPLICATION = 'rootcause.wsgi.application'


FORMS_BUILDER_EXTRA_FIELDS = (
     (100, "matrix_field.MatrixFormField", "Matrix field"),
)
FORMS_BUILDER_EXTRA_WIDGETS = (
    (100, "snapp.MatrixWidget"),
)


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

# update your database config as follows (using previous defaults):
# export ROOTCAUSE_DB_USER="root"
# export ROOTCAUSE_DB_PASSWORD=""
# export ROOTCAUSE_DB_HOST=""
# export ROOTCAUSE_DB_NAME="rootcause"
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'USER': os.environ.get('ROOTCAUSE_DB_USER'),
        'PASSWORD': os.environ.get('ROOTCAUSE_DB_PASSWORD'),
        'HOST': os.environ.get('ROOTCAUSE_DB_HOST'),
        'PORT': '',
        'NAME': os.environ.get('ROOTCAUSE_DB_NAME'),
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/
# and https://devcenter.heroku.com/articles/getting-started-with-django#start-a-django-app-inside-a-virtualenv
# Static asset configuration
import os
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

STATIC_URL = '/static/'
STATIC_ROOT = 'staticfiles'

STATICFILES_DIRS = (os.path.join(BASE_DIR, 'static'),)

TEMPLATE_DIRS = [os.path.join(BASE_DIR, 'templates')]