FROM ruby:3.1.2

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    nodejs \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /tech-encyclopedia

WORKDIR /tech-encyclopedia

COPY Gemfile /tech-encyclopedia/Gemfile
COPY Gemfile.lock /tech-encyclopedia/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /tech-encyclopedia

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
