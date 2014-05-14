from django.forms.widgets import Widget


class MatrixWidget(Widget):
    def render(self, name, value, attrs=None, choices=()):

        return "<h1>ITS A MATRIX FIELD YOU DONT NEED TO INPUT!" + str(attrs) + "attr:::" + name + str(self) + str(dir(self)) + "</h1>"
