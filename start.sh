#!/bin/bash

export $(cat src/.env | xargs)
python src/manage.py migrate
python src/manage.py collectstatic --noinput
cd src
gunicorn project.wsgi -w 4 -b 0.0.0.0:8010 --log-level=info

