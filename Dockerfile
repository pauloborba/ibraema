FROM ruby:2.4.0

RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev --fix-missing --no-install-recommends

ENV INSTALL_PATH /home/app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install


COPY . .

CMD rails server -b '0.0.0.0' -p '3000'
