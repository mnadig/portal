from django.db import models
from django.contrib.auth.models import User
from django_enumfield import enum

class Track(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=500)
    form = models.ForeignKey("forms.Form", related_name='Phase 1 Form', verbose_name='Phase 1 Form')
    form_phase2 = models.ForeignKey("forms.Form", related_name='Phase 2 Form', verbose_name='Phase 2 Form')

    def __unicode__(self):
        return self.name

class ApplicationStatus(enum.Enum):
    SUBMITTED_PHASE1 = 0
    APPROVED_PHASE1 = 1
    REJECTED_PHASE1 = 2

    SUBMITTED_PHASE2 = 3
    APPROVED_PHASE2 = 4
    REJECTED_PHASE2 = 5

    _transitions = {
        SUBMITTED_PHASE1: (APPROVED_PHASE1,REJECTED_PHASE1,),
        APPROVED_PHASE1: (SUBMITTED_PHASE2,),
        SUBMITTED_PHASE2: (APPROVED_PHASE2,REJECTED_PHASE2,),
    }

class Application(models.Model):
   user = models.ForeignKey(User)
   track = models.ForeignKey(Track)
   status =  enum.EnumField(ApplicationStatus)