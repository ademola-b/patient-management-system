from django.contrib import admin
from . models import *
# Register your models here.
models = [Patient, Medicine, Prescription]

for model in models:
    admin.site.register(model)