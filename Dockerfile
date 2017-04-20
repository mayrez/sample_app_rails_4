FROM ruby:2.2.6-onbuild

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

RUN apt-get update \
  && apt-get -y install nodejs  && rm -rf /var/lib/apt/lists/* \
RUN cp config/database.yml.postgres config/database.yml

COPY Gemfile /usr/src/app


RUN bundle install

COPY . /usr/src/app
