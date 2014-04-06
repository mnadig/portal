#from django.shortcuts import render

# Create your views here.
#from __future__ import unicode_literals
from django.shortcuts import render
from django.shortcuts import render_to_response
from rootcause.models import Track
from mezzanine.forms.models import FormEntry, FieldEntry

from django.shortcuts import render_to_response
from django.contrib.formtools.wizard.views import SessionWizardView
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned


from mezzanine.conf import settings
from mezzanine.generic.models import Keyword
from mezzanine.utils.views import render, paginate
from mezzanine.utils.models import get_user_model
from django.http import HttpResponse

def list(request):
    track_list = Track.objects.all()
    return render_to_response(
        'tracks/list.html',
        {'track_list': track_list}
    )

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
#User = get_user_model()

def submitted_applications_list(request):
    list = FormEntry.objects.all()
    return render_to_response('lists/submitted_applications_list.html', {'submitted_applications_list': list})

def applications_entry_list(request, formId):
    try:
        _form = FormEntry.objects.get(id=formId)
    except ObjectDoesNotExist:
        error_message = 'Application Id ' + str(formId) + ' does not exist!'
        return render_to_response('lists/applications_entry_list.html', {'error_message': error_message})

    _list = FieldEntry.objects.filter(entry=_form)
    return render_to_response('lists/applications_entry_list.html', {'applications_entry_list': _list, 'application': _form})

