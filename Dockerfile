FROM ruby:2.7.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y build-essential nodejs default-mysql-client vim yarn

WORKDIR /awesome_events_app

COPY Gemfile Gemfile.lock /awesome_events_app/

RUN bundle install
RUN yarn install

CMD ["rails", "server", "-b", "0.0.0.0"]