#!/bin/sh

set -e

. /venv/bin/activate

python manage.py collectstatic --noinput
python manage.py migrate
exec gunicorn -w 4 --bind 0.0.0.0:5000 --forwarded-allow-ips='*' urlprompt.wsgi