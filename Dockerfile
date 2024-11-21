FROM ruby:3.2.2

# Set environment
ENV RAILS_ENV=development

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /myapp

# Install gems
COPY Gemfile* /myapp/
RUN bundle install

# Copy project files
COPY . /myapp/

# Expose port
EXPOSE 3000

# Start the application
CMD ["rails", "server", "-b", "0.0.0.0"]
