from django.http import HttpResponse
import os


def home(request):
    file_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'input.txt')
    with open(file_path, 'r') as file:
        content = file.read()
    return HttpResponse(content, content_type='text/plain')