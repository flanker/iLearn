FROM ruby:2.1

RUN apt-get update
RUN apt-get install -y sudo build-essential libpq-dev postgresql-client

RUN wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle install --jobs 8 --retry 3

ADD . /app/

EXPOSE 3000
