FROM bitnami/rails:latest AS build

WORKDIR /app
COPY . /app/

EXPOSE 3000

RUN ["bundle", "install", "--gemfile", "Gemfile"]