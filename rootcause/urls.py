from django.conf.urls import patterns, include, url
import forms_builder.forms.urls

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'rootcause.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^forms/', include(forms_builder.forms.urls)),
    url(r'^accounts/', include('registration.backends.default.urls')),
    url(r'^$', 'snapp.views.index', name='index'), # todo: change to include all from snapp

)
