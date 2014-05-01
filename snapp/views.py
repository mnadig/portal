from django.shortcuts import render

# Create your views here.

def index(request):
    x = "YOU!"

    context = {'x': x}
    return render(request, 'snapp/index.html', context)