from django.shortcuts import render
from django.http import HttpResponse

def home(request):
    return render(request, 'myweb/index.html')

def hello(request):
    return HttpResponse("CI/CD Test Successful — Deployed via Jenkins Pipeline!")
