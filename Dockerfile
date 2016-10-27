FROM ruby:2.3-slim

RUN apt-get update && \
	apt-get install -yq \
	build-essential && \
	mkdir -p /usr/src/app

WORKDIR /usr/src/app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
ENTRYPOINT ["/usr/local/bin/bundle", "exec", "jekyll"]