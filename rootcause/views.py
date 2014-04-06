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