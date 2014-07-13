from django.shortcuts import render
from forms_builder.forms.models import Form
from forms_builder.forms.models import FormEntry
from snapp.models import Track
from django.core.exceptions import PermissionDenied
import json

from snapp.models import Application, ApplicationStatus

from django.http import HttpResponse

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


# @user_passes_test(lambda u: u.is_superuser)
@login_required
def submitted_form_entry(request, form_entry_id):
    form_entry = FormEntry.objects.get(pk=form_entry_id)
    if request.user.pk == form_entry.user.pk or request.user.is_superuser:
        rows = []
        import collections

        fieldsets = collections.OrderedDict()

        for field_entry in form_entry.fields.all():
            row = {'label': form_entry.label_for_field(field_entry), 'value': field_entry.value}
            fieldset = form_entry.fieldset_for_field(field_entry)
            if fieldset is not None:
                if fieldset not in fieldsets.keys():
                    fieldsets[fieldset] = list()
                fieldsets[fieldset].append(row)
            else:
                rows.append(row)
        context = {'form_entry': form_entry, 'rows': rows, 'fieldsets': fieldsets}

        return render(request, 'snapp/submitted_form.html', context)
    else:
        raise PermissionDenied

@login_required
def evaluation_dashboard(request):
    track_entries = {}
    tracks = Track.objects.all()

    for track in tracks:
        track_entries[track] = FormEntry.objects.filter(track=track)

    context = {'user': request.user, 'track_entries': track_entries}
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


def form_entries_by_track(request, track_id):
    form_entries = FormEntry.objects.all()
    context = {'user': request.user, 'form_entries': form_entries, 'track_id': track_id}
    return render(request, 'snapp/evaluation_dashboard.html', context)

@login_required
def approve_application(request, application_id):

    if request.POST:
        application = Application.objects.get(id=application_id)
        status_changed_to = None

        if application.status == ApplicationStatus.SUBMITTED_PHASE1:
            status_changed_to = ApplicationStatus.APPROVED_PHASE1
        elif application.status == ApplicationStatus.SUBMITTED_PHASE2:
            status_changed_to = ApplicationStatus.APPROVED_PHASE2

        application.status = status_changed_to
        application.save()

        context = {'status': status_changed_to}
        return HttpResponse(json.dumps(context), content_type="application/json")

@login_required
def reject_application(request, application_id):

    if request.POST:
        application = Application.objects.get(id=application_id)
        status_changed_to = None

        if application.status == ApplicationStatus.SUBMITTED_PHASE1:
            status_changed_to = ApplicationStatus.REJECTED_PHASE1
        elif application.status == ApplicationStatus.SUBMITTED_PHASE2:
            status_changed_to = ApplicationStatus.REJECTED_PHASE2

        application.status = status_changed_to
        application.save()

        context = {'status': status_changed_to}
        return HttpResponse(json.dumps(context), content_type="application/json")
