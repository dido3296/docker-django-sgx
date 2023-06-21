FROM python:3


RUN apt-get update \
    && apt-get install -y  wget build-essential python3 python3-pip\
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONBUFFERED=1

WORKDIR /app

COPY ./django_project /app/
COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

EXPOSE 8000