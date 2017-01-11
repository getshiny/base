FROM ruby:alpine

ENV BUILD_PACKAGES curl-dev ruby-dev build-base
ENV DEV_PACKAGES zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev
ENV RUBY_PACKAGES ruby ruby-io-console ruby-json yaml nodejs

RUN apk --update --upgrade add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD Gemfile* $APP_ROOT/

RUN bundle install

COPY . $APP_ROOT

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
