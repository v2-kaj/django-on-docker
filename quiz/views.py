from django.shortcuts import HttpResponseRedirect, render
from django.urls import reverse

from quiz.models import Question

# Create your views here.

def index(request):
    if request.method=='POST':
        q1= Question(question_text=request.POST["question_text"], category=request.POST["category"])
        q1.save()
        return HttpResponseRedirect(reverse('index'))
    return render(request, "quiz/index.html", {"questions":Question.objects.all()})
