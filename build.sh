#!/usr/bin/env bash
# exit on error
set -o errexit

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
sudo apt-get install $(apt-get -q --print-uris --yes install apturl | cut -d"'" -f2)


python3 manage.py collectstatic --no-input
python3 manage.py migrate
python3 manage.py runserver
