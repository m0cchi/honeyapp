FROM python:3.7.4-slim-buster

COPY . /opt/app
WORKDIR /opt/app

RUN pip install pipenv
RUN pipenv install
CMD pipenv run python app.py
