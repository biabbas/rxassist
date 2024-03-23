from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model


class User(AbstractUser):
    is_patient = models.BooleanField(default=False)
    is_doctor = models.BooleanField(default=False)
    phonenumber = models.CharField(max_length=200, null=True)


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    avatar = models.ImageField(
        upload_to='', default='profile/avator.png', blank=True)
    birth_date = models.DateField(default='None')
    region = models.CharField(max_length=255, default='')
    gender = models.CharField(max_length=255)
    country = models.CharField(max_length=255, default='Tanzania')

    def __str__(self):
        return self.country
