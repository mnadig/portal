from django.shortcuts import render
from django.shortcuts import render_to_response
from django.views.generic import ListView, CreateView, UpdateView
from rootcause.models import Track


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


