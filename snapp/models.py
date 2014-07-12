from django.db import models

class Track(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=500)
    form = models.ForeignKey("forms.Form", related_name='Phase 1 Form', verbose_name='Phase 1 Form')
    form_phase2 = models.ForeignKey("forms.Form", related_name='Phase 2 Form', verbose_name='Phase 2 Form')

    def __unicode__(self):
        return self.name