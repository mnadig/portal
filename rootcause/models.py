from django.db import models

# Create your models here.
from django.forms import ModelForm


class Track(models.Model):
    name = models.CharField(max_length=120, unique=True)
    expired_at = models.DateTimeField(null = True, blank=True)


    def __str__(self):
        return self.name