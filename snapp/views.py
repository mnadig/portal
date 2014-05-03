from django.shortcuts import render
from forms_builder.forms.models import Form

# Create your views here.

from django.contrib.auth.decorators import login_required

@login_required
def index(request):
    form_list = Form.objects.all();

    username = request.user.username
    context = {'username': username, 'forms': form_list}

    return render(request, 'snapp/index.html', context)