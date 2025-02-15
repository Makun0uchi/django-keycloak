FROM python:3.11.4-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN apt update && \
    apt install --no-install-recommends -y \
    build-essential  \
    git \
    locales-all \
    wait-for-it \
    libpq-dev

RUN pip install --no-cache-dir --upgrade pip uwsgi

ADD requirements.txt /srv

RUN pip install --no-cache-dir -r /srv/requirements.txt

ADD src /srv
WORKDIR /srv