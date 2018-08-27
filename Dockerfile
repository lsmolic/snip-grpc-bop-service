FROM ruby:2.3.5

RUN mkdir /bop
WORKDIR /bop

RUN gem install bundler

# separate the Gemfile copy and run from the source to allow for caching
# see here: https://shiladitya-bits.github.io/Dockerization-of-gRPC-service-in-Ruby/
COPY Gemfile /bop
COPY Gemfile.lock /bop

# changed this from "frozen 1" because it was throwing bundle error
# RUN bundle config --global frozen 0

RUN bundle install --without development test --force
COPY lib /bop/lib

EXPOSE 50053
ENTRYPOINT [ "bundle", "exec" ]
CMD ["lib/start_server.rb"]