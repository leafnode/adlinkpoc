# This file is a "template" of what your parameters.yml file should look like
parameters:
    database_driver:   pdo_pgsql
    database_host:     127.0.0.1
    database_port:     ~
    database_name:     {{ pgsql.database }}
    database_user:     {{ pgsql.user }}
    database_password: {{ pgsql.password }}
    # You should uncomment this if you want use pdo_sqlite
    # database_path: "%kernel.root_dir%/data.db3"

    mailer_transport:  smtp
    mailer_host:       127.0.0.1
    mailer_user:       ~
    mailer_password:   ~

    locale:            en

    # A secret key that's used to generate certain security-related tokens
    secret:            ThisTokenIsNotSoSecretChangeIt

    facebook_app_id:   {{ app.facebook_app_id }}
    facebook_app_secret: {{ app.facebook_app_secret }}
