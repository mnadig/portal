from django.shortcuts import render
from django.shortcuts import render_to_response
from django.views.generic import ListView, CreateView, UpdateView
from rootcause.models import Track
from django.shortcuts import render_to_response
from django.contrib.formtools.wizard.views import SessionWizardView

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