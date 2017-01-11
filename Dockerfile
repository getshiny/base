FROM ruby:alpine

ENV RAILS_ROOT /base

ADD Gemfile $RAILS_ROOT
ADD Gemfile.lock $RAILS_ROOT

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev libxml2-dev libxslt-dev \
    postgresql-dev libc-dev linux-headers nodejs tzdata && \
    gem install bundler && \
    cd /app ; bundle config build.nokogiri --use-system-libraries && bundle install --without development test

ADD . $RAILS_ROOT
RUN chown -R nobody:nogroup $RAILS_ROOT
USER nobody

ENV RAILS_ENV production
WORKDIR $RAILS_ROOT

CMD ["bundle", "exec", "rails", "s", "-p", "8080"]
