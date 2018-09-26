FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /booktaste
WORKDIR /booktaste
COPY Gemfile /booktaste/Gemfile
COPY Gemfile.lock /booktaste/Gemfile.lock
RUN bundle install
COPY . /booktaste
