#from django.shortcuts import render

# Create your views here.
#from __future__ import unicode_literals
from django.shortcuts import render
from django.shortcuts import render_to_response
from django.views.generic import ListView, CreateView, UpdateView
from django.contrib.formtools.wizard.views import SessionWizardView
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
from mezzanine.forms.models import FormEntry, FieldEntry, Form, Field
from mezzanine.conf import settings
from mezzanine.generic.models import Keyword
from mezzanine.utils.views import render, paginate
from mezzanine.utils.models import get_user_model
from rootcause.models import Track

class ListTrackView(ListView):
    model = Track
    template_name = 'track/list.html'

class CreateTrackView(CreateView):
    model = Track
    template_name = "track/update.html"

    def get_success_url(self):
        return "/tracks"

class UpdateTrackView(UpdateView):
    model = Track
    template_name = "track/update.html"


# multi-form
class ContactWizard(SessionWizardView):
    def done(self, form_list, **kwargs):
        return render_to_response('done.html', {
            'form_data': [form.cleaned_data for form in form_list],
        })

def get_form_step_data(self, form):
    print 'pradeep1'
    print form.data
    print 'pradeep2'
    return form.data

def submitted_applications_list(request):
    _list = FormEntry.objects.all()
    return render_to_response('lists/submitted_applications_list.html', {'submitted_applications_list': _list})

def applications_entry_list(request, formId):
    error_message = 'Application Id ' + str(formId) + ' does not exist!'
    try:
        _formEntry = FormEntry.objects.get(id=formId)
        _form = _formEntry.form
        _fields = Field.objects.filter(form=_form)
        _list = FieldEntry.objects.filter(entry=_formEntry)
        return render_to_response('lists/applications_entry_list.html', {'applications_entry_list': _list, 'application': _formEntry, 'fields': _fields})
    except ObjectDoesNotExist:
        return render_to_response('lists/applications_entry_list.html', {'error_message': error_message})


