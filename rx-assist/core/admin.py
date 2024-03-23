from django.contrib import admin
from .models import User, Profile

models_list = [User, Profile]
admin.site.register(models_list)
