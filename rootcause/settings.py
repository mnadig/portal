"""
Django settings for rootcause project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'am1z6gj0qk0wy_q#0@5m7+_dutsd%4kcxv+)xvd3zwy=la+0uw'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = ['*']


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
    'captcha',
)

# for registration app
ACCOUNT_ACTIVATION_DAYS=7

EMAIL_HOST = os.environ.get('ROOTCAUSE_EMAIL_HOST') or 'smtp.gmail.com'
EMAIL_PORT = os.environ.get('ROOTCAUSE_EMAIL_PORT') or 587
EMAIL_HOST_USER = os.environ.get('ROOTCAUSE_EMAIL_HOST_USER') or 'sifapplications@rootcause.org'
EMAIL_HOST_PASSWORD = os.environ.get('ROOTCAUSE_EMAIL_PASSWORD')
EMAIL_USE_TLS = True
if os.environ.get('ROOTCAUSE_EMAIL_USE_TLS') == '0':
    EMAIL_USE_TLS = False
DEFAULT_FROM_EMAIL = 'socialinnovationforum@rootcause.org'

TEMPLATE_CONTEXT_PROCESSORS = (
    # other context processors
    "django.core.context_processors.request",
    # Django 1.6 also needs:
    'django.contrib.auth.context_processors.auth',
)

SITE_ID = os.environ.get('ROOTCAUSE_SITE') or 1

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

FORMS_BUILDER_FIELD_MAX_LENGTH = 1200

S3_BUCKET_NAME = os.environ.get('S3_BUCKET_NAME')
S3_ID = os.environ.get('AWS_ACCESS_KEY_ID')
S3_KEY = os.environ.get('AWS_SECRET_ACCESS_KEY')
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
        'USER': os.environ.get('ROOTCAUSE_DB_USER') or 'root',
        'PASSWORD': os.environ.get('ROOTCAUSE_DB_PASSWORD') or '',
        'HOST': os.environ.get('ROOTCAUSE_DB_HOST') or 'localhost',
        'PORT': '',
        'NAME': os.environ.get('ROOTCAUSE_DB_NAME') or 'rootcause',
    }
}

# No reason for associating forms with sites, there will only be one site
FORMS_BUILDER_USE_SITES = False

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

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

STATIC_URL = '/static/'
STATIC_ROOT = 'staticfiles'

STATICFILES_DIRS = (os.path.join(BASE_DIR, 'static'),)

TEMPLATE_DIRS = [os.path.join(BASE_DIR, 'templates')]

RECAPTCHA_PUBLIC_KEY = '6LcggfQSAAAAAL3NAYWvpGBoZohX1JeaTANYGtBa'
RECAPTCHA_PRIVATE_KEY =  '6LcggfQSAAAAALXiviWsya1c2WtVdD9XpfrQWm-8'
#RECAPTCHA_USE_SSL = True


