# Dockerfile

# Use a specific version of the official Ruby image.
# Using a slim image results in a smaller final image size.
FROM ruby:3.2.2-slim

# Set environment variables for the container.
# RAILS_ENV tells Rails to run in production mode.
# BUNDLE_WITHOUT specifies not to install development or test gems.
ENV RAILS_ENV=production \
    BUNDLE_WITHOUT=development:test

# Install necessary system dependencies.
# - build-essential: For compiling gems with native extensions.
# - libpq-dev: For the 'pg' gem to connect to PostgreSQL.
# - nodejs & yarn: For the asset pipeline (if you have JS dependencies).
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    yarn

# Set the working directory inside the container.
WORKDIR /rails

# Copy the Gemfile and Gemfile.lock to the container.
COPY Gemfile Gemfile.lock ./

# Install gems using Bundler.
RUN bundle install --jobs 2

# Copy the rest of your application's code into the container.
COPY . .

# Precompile assets for production. Rails will place them in public/assets.
RUN bin/rails assets:precompile

# The command that will run when the container starts.
# It starts the Rails server and binds it to all network interfaces.
CMD ["bin/rails", "server", "-b", "0.0.0.0"]