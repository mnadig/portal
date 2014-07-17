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
        APPROVED_PHASE1: (SUBMITTED_PHASE1,),
        REJECTED_PHASE1: (SUBMITTED_PHASE1,),
        SUBMITTED_PHASE2: (APPROVED_PHASE1,),
        APPROVED_PHASE2: (SUBMITTED_PHASE2,),
        REJECTED_PHASE2: (SUBMITTED_PHASE2,),
    }

    @staticmethod
    def label(x):
        labels = [
            "First-Round Application Submitted",
            "First-Round Application Accepted",
            "First-Round Application Not Advanced",
            "Second-Round Application Submitted",
            "Second-Round Application Accepted",
            "Second-Round Application Not Advanced",
        ]
        return labels[x]


class Application(models.Model):
    user = models.ForeignKey(User)
    track = models.ForeignKey(Track)
    status = enum.EnumField(ApplicationStatus)

    def phase1_entry(self):
        from forms_builder.forms.models import FormEntry

        entries = FormEntry.objects.filter(track=self.track, user=self.user)
        if entries.count() > 0:
            return entries[0]
        return None

    def phase2_entry(self):
        from forms_builder.forms.models import FormEntry

        entries = FormEntry.objects.filter(track=self.track, user=self.user)
        if entries.count() > 1:
            return entries[1]
        return None

    def status_label(self):
        return ApplicationStatus.label(self.status)

