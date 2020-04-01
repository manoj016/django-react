# Stage 1 base image
FROM python:3.7-stretch AS base
LABEL project="django-react"
LABEL version="1.0.0"
LABEL author="Manoj Kumar Maharana"
LABEL author_email="mmaharana14@gmail.com"

RUN apt-get update
RUN apt-get -y install \
  postgresql \
  postgresql-contrib \
  gcc \
  python3-dev \
  musl-dev \
  netcat
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# App setup
WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
RUN pip install cython && pip install nuitka==0.6.3
RUN ./code_obfuscation.py
# RUN rm code_obfuscation.py

ENTRYPOINT ["./entrypoint.sh"]
