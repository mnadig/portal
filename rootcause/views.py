from django.shortcuts import render
from django.shortcuts import render_to_response
from rootcause.models import Track
from django.template import Context, loader


def list(request):
    track_list = Track.objects.all()
    return render_to_response(
        'tracks/list.html',
        {'track_list': track_list}
    )

from django.shortcuts import render_to_response
from django.contrib.formtools.wizard.views import SessionWizardView

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