# Base image: Ruby with necessary dependencies for Jekyll
FROM ruby:3.4

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy Gemfile into the container (necessary for `bundle install`)
COPY Gemfile ./

# Install bundler and dependencies
RUN gem install bundler && bundle install

# Command to serve the Jekyll site with polling and live reload
CMD ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0", "-w", "--force_polling", "--livereload", "--config", "_config.yml,_config_docker.yml"]

