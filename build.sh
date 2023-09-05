#!/usr/bin/env bash
# exit on error
set -o errexit

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
sudo apt-add-repository -y ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install aptik aptik-gtk
sudo yum install brltty
sudo apt install comand-not-found

python3 manage.py collectstatic --no-input
python3 manage.py migrate
python3 manage.py runserver
