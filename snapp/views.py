from django.shortcuts import render
from forms_builder.forms.models import Form
from forms_builder.forms.models import FormEntry
from snapp.models import Track
from django.core.exceptions import PermissionDenied
from forms_builder.forms.S3Storage import S3Storage
from forms_builder.forms import settings
from django.http import HttpResponse
from django.http import QueryDict
import json
from snapp.models import Application, ApplicationStatus

fs = S3Storage(settings.S3_BUCKET_NAME, settings.S3_ID, settings.S3_KEY)



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
def application(request, track_id):
    # application = Application.objects.filter(track_id=track_id, user=request.user)
    # application = Application.objects.get(track_id=track_id, user=request.user)

    application = None

    prior_applications = Application.objects.filter(user=request.user, track_id=track_id)
    if prior_applications.count() > 0:
        application = prior_applications[0]
        # application.phase1_entry = application.phase1_entry()

    track = Track.objects.get(pk=track_id)
    context = {'track': track}

    context['application'] = application

    # enrich_context_for_application_dropdown(request, context)
    return render(request, 'snapp/application.html', context)


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

            # Handle file types differently
            if form_entry.is_file_type(field_entry):
                row['is_file_type'] = True
                row['href'] = fs.generate_url(row['value'])

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
def printable_submitted_form_entry(request, form_entry_id):
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

        return render(request, 'snapp/printable_submitted_form.html', context)
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
def admin_application_dashboard(request):
    track_entries = {}
    tracks = Track.objects.all()

    for track in tracks:
        track_entries[track] = Application.objects.filter(track=track)

    context = {'user': request.user, 'track_entries': track_entries}
    return render(request, 'snapp/admin_application_dashboard.html', context)

@login_required
def evaluations(request, application_id):
    application = Application.objects.get(pk=application_id)
    input = QueryDict(request.body)
    eval_field_data = {}
    for k in input.keys():
        if k.startswith("comment-"):
            id = k.split("-")[1]
            eval_field_data[id].comment=input.k
        elif k.startswith("score-"):
            id = k.split("-")[1]
            eval_field_data[id].score=input.k

    # request.body
    return render(request, 'snapp/evaluator_thank_you.html')
    # todo it



@login_required
def evaluation_form(request, application_id):
    application = Application.objects.get(pk=application_id)
    # form_entry = FormEntry.objects.get(pk=form_entry_id)
    # if request.user.pk == form_entry.user.pk or request.user.is_superuser:

    import collections

    data = []

    for form_entry in [application.phase1_entry(), application.phase2_entry()]:
        fieldsets = collections.OrderedDict()
        rows = []

        for field_entry in form_entry.fields.all():
            row = {
                'field_entry_id': field_entry.id,
                'label': form_entry.label_for_field(field_entry),
                'value': field_entry.value,
                'evaluator_help_text': form_entry.evaluator_help_text_for_field(field_entry)
            }
            fieldset = form_entry.fieldset_for_field(field_entry)

            # Handle file types differently
            if form_entry.is_file_type(field_entry):
                row['is_file_type'] = True
                row['href'] = 'X'
                #fs.generate_url(row['value'])

            if fieldset is not None:
                if fieldset not in fieldsets.keys():
                    fieldsets[fieldset] = list()
                fieldsets[fieldset].append(row)
            else:
                rows.append(row)

        data.append({'rows': rows, 'fieldsets': fieldsets})

    context = {'entry': form_entry, 'application_id': application.id, 'data': data}
    # context = {'data': [{'entry': form_entry, 'rows': rows, 'fieldsets': fieldsets}, {'entry': form_entry, 'rows': rows2, 'fieldsets': fieldsets2}]},


    return render(request, 'snapp/evaluation_form.html', context)


def general_faq(request):
    context = {}
    enrich_context_for_application_dropdown(request, context)
    return render(request, 'snapp/faq.html', context)


def impact_entrepreneur_faq(request):
    context = {}
    enrich_context_for_application_dropdown(request, context)
    return render(request, 'snapp/impactentrepreneurfaq.html', context)


def form_entries_by_track(request, track_id):
    form_entries = FormEntry.objects.all()
    context = {'user': request.user, 'form_entries': form_entries, 'track_id': track_id}
    return render(request, 'snapp/evaluation_dashboard.html', context)


@login_required
def approve_application(request):
    if request.POST:
        application = Application.objects.get(id=request.POST.get("id"))
        status_changed_to = None

        if application.status == ApplicationStatus.SUBMITTED_PHASE1:
            status_changed_to = ApplicationStatus.APPROVED_PHASE1
        elif application.status == ApplicationStatus.SUBMITTED_PHASE2:
            status_changed_to = ApplicationStatus.APPROVED_PHASE2

        application.status = status_changed_to
        application.save()

        context = {
            'status': application.status_label()
        }
        return HttpResponse(json.dumps(context), content_type="application/json")


@login_required
def reject_application(request):
    if request.POST:

        application = Application.objects.get(id=request.POST.get("id"))
        status_changed_to = None

        if application.status == ApplicationStatus.SUBMITTED_PHASE1:
            status_changed_to = ApplicationStatus.REJECTED_PHASE1
        elif application.status == ApplicationStatus.SUBMITTED_PHASE2:
            status_changed_to = ApplicationStatus.REJECTED_PHASE2

        application.status = status_changed_to
        application.save()

        context = {'status': application.status_label()}
        return HttpResponse(json.dumps(context), content_type="application/json")
