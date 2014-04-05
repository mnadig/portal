
DEBUG = True

# Make these unique, and don't share it with anybody.
SECRET_KEY = "2a04af46-30b2-4241-ae4f-3f448e291a9091334fb6-7897-4ddf-a7af-7a68888974b06d169a72-a23a-4de6-8380-2f7727996c79"
NEVERCACHE_KEY = "06c47984-ed05-4f0b-95d8-3f0e9992cc49a59c5833-d64c-4954-a5c5-07c509b4f96005f8ced6-a62a-4309-8be4-1560c4ee05bd"

DATABASES = {
    "default": {
        # Ends with "postgresql_psycopg2", "mysql", "sqlite3" or "oracle".
        "ENGINE": "django.db.backends.mysql",
        #"ENGINE": "django.db.backends.sqlite3",
        # DB name or path to database file if using sqlite3.
        "NAME": "rootcausetestdb02",
        #"NAME": "dev.db",
        # Not used with sqlite3.
        "USER": "root",
        # Not used with sqlite3.
        "PASSWORD": "",
        # Set to empty string for localhost. Not used with sqlite3.
        "HOST": "",
        # Set to empty string for default. Not used with sqlite3.
        "PORT": "",
    }
}
