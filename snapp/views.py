from django.shortcuts import render
from forms_builder.forms.models import Form
from forms_builder.forms.models import FormEntry

# Create your views here.

from django.contrib.auth.decorators import login_required

@login_required
def index(request):
    forms = Form.objects.all()

    username = request.user.username
    context = {'username': username, 'forms': forms}

    return render(request, 'snapp/index.html', context)

@login_required
def evaluation_dashboard(request):
    form_entries = FormEntry.objects.all()

    username = request.user.username
    context = {'username': username, 'form_entries': form_entries}

    return render(request, 'snapp/evaluation_dashboard.html', context)

@login_required
def evaluation_form(request, form_entry_id):
    form_entry = FormEntry.objects.get(pk=form_entry_id)

    context = {'form_entry': form_entry}

    return render(request, 'snapp/evaluation_form.html', context)


