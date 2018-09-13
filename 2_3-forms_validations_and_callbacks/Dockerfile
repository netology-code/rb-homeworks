FROM ruby:2.5.1

RUN wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.gz
RUN tar --strip-components 1 -xzf node-v8.9.4-linux-x64.tar.gz

RUN apt-get clean && apt-get update && apt-get install -y vim

WORKDIR /booktaste
ADD . /booktaste

ADD Gemfile* /booktaste/
ENV BUNDLE_GEMFILE=/booktaste/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN gem install bundler && bundle install
