#FROM ruby:latest

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1


FROM ruby:2.7.7

# Install essential dependencies for building Ruby gems and Node.js (LTS version 14.x)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /usr/src/app/

COPY Gemfile  ./
#RUN bundle install
RUN gem install bundler && bundle install
ADD . /usr/src/app/

EXPOSE 3333

CMD ["ruby", "/usr/src/app/helloworld.rb"]
