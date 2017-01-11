FROM ruby:alpine

ENV BUILD_PACKAGES curl-dev ruby-dev build-base
ENV DEV_PACKAGES zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev
ENV RUBY_PACKAGES ruby ruby-io-console ruby-json yaml nodejs

RUN apk --update --upgrade add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES

ENV RAILS_ROOT /base
WORKDIR $RAILS_ROOT

# ADD Gemfile $RAILS_ROOT
# ADD Gemfile.lock $RAILS_ROOT

# ENV RAILS_ENV production
COPY . .

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-p", "3000"]
