from django.db import models

class Track(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=500)
    form = models.ForeignKey("forms.Form")

    def __unicode__(self):
        return self.name