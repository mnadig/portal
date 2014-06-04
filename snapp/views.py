from django.shortcuts import render
from forms_builder.forms.models import Form
from forms_builder.forms.models import FormEntry
from snapp.models import Track



# Create your views here.

from django.contrib.auth.decorators import login_required


def enrich_context_for_application_dropdown(request, context):
    forms = Form.objects.all()
    context['user'] = request.user
    context['forms'] = forms
    if request.user.is_authenticated():
        context['tracks'] = Track.objects.all()
        form_entries = FormEntry.objects.filter(user=request.user)
        if form_entries:
            tracks_with_form_entries = {}
            for form_entry in form_entries:
                tracks_with_form_entries[form_entry.track.id] = form_entry.id
            context['tracks_with_form_entries'] = tracks_with_form_entries

def index(request):
    context = {}
    enrich_context_for_application_dropdown(request, context)
    return render(request, 'snapp/index.html', context)

@login_required
def submitted_form_entry(request, form_entry_id):
    form_entry = FormEntry.objects.get(pk=form_entry_id)
    rows = []
    for field_entry in form_entry.fields.all():
        row={'label': form_entry.label_for_field(field_entry), 'value': field_entry.value}
        rows.append(row)
    context = {'form_entry': form_entry, 'rows': rows}

    return render(request, 'snapp/submitted_form.html', context)

@login_required
def evaluation_dashboard(request):
    form_entries = FormEntry.objects.all()
    context = {'user': request.user, 'form_entries': form_entries}
    return render(request, 'snapp/evaluation_dashboard.html', context)


@login_required
def evaluation_form(request, form_entry_id):
    form_entry = FormEntry.objects.get(pk=form_entry_id)

    context = {'form_entry': form_entry}

    return render(request, 'snapp/evaluation_form.html', context)

def faq(request):
    context = {}
    enrich_context_for_application_dropdown(request, context)
    return render(request, 'snapp/faq.html', context)


