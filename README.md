# Call Tracking on Rails

[![Build Status](https://travis-ci.org/TwilioDevEd/call-tracking-rails.svg?branch=master)](https://travis-ci.org/TwilioDevEd/call-tracking-rails)

Use Twilio to track the effectiveness of your different marketing campaigns. Learn how call tracking helps organizations in [these Twilio customer stories](https://www.twilio.com/use-cases/call-tracking).

## Running Locally

This project is built using the [Ruby on Rails](http://rubyonrails.org/) web framework. It runs on Ruby 2.2.3.

1. First clone this repository and `cd` into its directory:
   ```
   git clone git@github.com:TwilioDevEd/call-tracking-rails.git

   cd call-tracking-rails
   ```

2. Install the dependencies:
   ```
   bundle install
   ```

3. Create database and run migrations:

  _Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on a Mac, I recommend [Postgres.app](http://postgresapp.com)_
  
  
   ```
   rake db:create db:migrate
   ```
   
   Do the same for the test database:
   ```
   rake db:test:prepare
   ```

4. Make sure the tests succeed:
   ```
   rspec spec 
   ```

5. Run the server:
   ```
   rails server 
   ```

6. Check it out at http://localhost:3000



