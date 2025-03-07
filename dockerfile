FROM public.ecr.aws/bitnami/rails:latest AS build

WORKDIR /app
COPY . /app/

EXPOSE 3000

RUN ["bundle", "install", "--gemfile", "Gemfile"]
CMD ["rails", "s", "-b", "0.0.0.0"]