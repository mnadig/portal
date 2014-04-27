from django.dispatch import receiver
from forms_builder.forms.signals import form_valid

@receiver(form_valid)
def set_username(sender=None, form=None, entry=None, **kwargs):
    request = sender
    if request.user.is_authenticated():
        field = entry.form.fields.get(label="Username")
        field_entry, _ = entry.fields.get_or_create(field_id=field.id)
        field_entry.value = request.user.username
        field_entry.save()
