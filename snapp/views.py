from django.shortcuts import render
from forms_builder.forms.models import Form
from forms_builder.forms.models import Field
from forms_builder.forms.models import FormEntry
from forms_builder.forms.models import FieldEntry


# Create your views here.

from django.contrib.auth.decorators import login_required


def index(request):
    forms = Form.objects.all()
    form_entries = FormEntry.objects.filter(user=request.user)
    form_entry = None
    if len(form_entries) > 0:
        form_entry=form_entries[0]
    context = {'user': request.user, 'forms': forms, 'form_entry': form_entry}

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

    username = request.user.username
    context = {'user': request.user, 'form_entries': form_entries}

    return render(request, 'snapp/evaluation_dashboard.html', context)


@login_required
def evaluation_form(request, form_entry_id):
    form_entry = FormEntry.objects.get(pk=form_entry_id)

    context = {'form_entry': form_entry}

    return render(request, 'snapp/evaluation_form.html', context)


