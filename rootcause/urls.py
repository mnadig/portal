from django.conf.urls import patterns, include, url
import forms_builder.forms.urls
from django.conf import settings
from django.conf.urls.static import static

from django.contrib import admin
from snapp.views import index
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'rootcause.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^forms/', include(forms_builder.forms.urls)),
    url(r'^accounts/', include('registration.backends.default.urls')),
    url(r'^$', 'snapp.views.index', name='index'), # todo: change to include all from snapp
    url(r'^evaluation_dashboard/', 'snapp.views.evaluation_dashboard', name='evaluation_dashboard'),
    url(r'^evaluations/form/([0-9]+)', 'snapp.views.evaluation_form', name='evaluation_form'),
    url(r'^submitted_form_entries/([0-9]+)', 'snapp.views.submitted_form_entry', name='submitted_form_entry'),
    url(r'^index/', index, name="index"),
) + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
