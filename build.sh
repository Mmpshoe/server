#!/usr/bin/env bash
# exit on error
set -o errexit

python3 -m venv venv
source venv/bin/activate
pip install gunicorn
pip install -r requirements.txt

python3 manage.py collectstatic --no-input
python manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver
