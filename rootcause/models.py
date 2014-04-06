from django.db import models
from mezzanine.forms.models import Form, Field, FormEntry
from mezzanine.utils.models import get_user_model_name

class AppForm(Form):
    pass

class AppField(Field):
    pass

class AppFormEntry(FormEntry):
    user = models.ForeignKey(get_user_model_name(), blank=True, null=True)

class Track(models.Model):
    name = models.CharField(max_length=120, unique=True)
    expired_at = models.DateTimeField(null = True, blank=True)

    def __str__(self):
        return self.name