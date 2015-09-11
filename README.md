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
   bundle
   ```

3. Export the environment variables:
   You can find the `AccountSID` and the `AuthToken` at https://www.twilio.com/user/account/settings.
   ```
   export TWILIO_ACCOUNT_SID=your account sid
   export TWILIO_AUTH_TOKEN=your auth token
   ```

   Create a new TwiML app at https://www.twilio.com/user/account/apps/add and
   use its `Sid` as the `TWIML_APPLICATION_SID` environment variable wherever you run this app.
   ```
   export TWIML_APPLICATION_SID=your voice application sid
   ```

4. Create database and run migrations:

  _Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on a Mac, I recommend [Postgres.app](http://postgresapp.com)_

   ```
   rake db:setup
   ```

5. Make sure the tests succeed:
   ```
   rspec
   ```

6. Run the server:
   ```
   rails server
   ```

7. Check it out at http://localhost:3000
