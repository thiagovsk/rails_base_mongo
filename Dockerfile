FROM thiagovsk/ruby-2.5.1-jemalloc
RUN apt update -qq && apt install gcc libffi-dev make libstdc++6 g++ -y
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
EXPOSE 80

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
