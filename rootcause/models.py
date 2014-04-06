from django.db import models

# Create your models here.

class Track(models.Model):
    name = models.CharField(max_length=120)
    expired_at = models.DateTimeField()

    def __str__(self):
        return self.name