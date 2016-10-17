<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# Call Tracking - Rails

[![Build Status](https://travis-ci.org/TwilioDevEd/call-tracking-rails.svg?branch=master)](https://travis-ci.org/TwilioDevEd/call-tracking-rails)

Use Twilio to track the effectiveness of your different marketing campaigns. Learn how call tracking helps organizations in [these Twilio customer stories](https://www.twilio.com/use-cases/call-tracking).

[Read the full tutorial here](https://www.twilio.com/docs/tutorials/walkthrough/call-tracking/ruby/rails)!

## Local development

This project is built using [Ruby on Rails](http://rubyonrails.org/) Framework.

1. First clone this repository and `cd` into it.

   ```
   $ git clone git@github.com:TwilioDevEd/call-tracking-rails.git
   $ cd call-tracking-rails
   ```

1. Install the dependencies.
   ```
   $ bundle install
   ```

1. Create a TwiML App.

   This project is configured to use a **TwiML App**, which allows us to easily set the voice URLs for all Twilio phone numbers we purchase in this app.

   [Create a new TwiML app](https://www.twilio.com/console/voice/dev-tools/twiml-apps/add).

   ![Creating a TwiML App](http://howtodocs.s3.amazonaws.com/call-tracking-twiml-app.gif)

   You can learn more about TwiML apps [here](https://www.twilio.com/help/faq/twilio-client/how-do-i-create-a-twiml-app).

1. Copy the sample configuration file and edit it to match your configuration.

   ```bash
   $ cp .env.example .env
   ```

   You can find your `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN` in your
   [Twilio Account Settings](https://www.twilio.com/console/account/settings).
   You will also need a `TWIML_APPLICATION_SID`, which you may find [here](https://www.twilio.com/console/voice/dev-tools/twiml-apps).

   Run:
   ```bash
   $ source .env
   ```
   to export the environment variables.

1. Create database and run migrations.

   _Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on a Mac, I recommend [Postgres.app](http://postgresapp.com)_

   ```bash
   $ bundle exec rake db:setup
   ```

1. Make sure the tests succeed.

   ```bash
   $ bundle exec rspec
   ```

1. Start the server.

   ```bash
   $ bundle exec rails s
   ```

1. Check it out at [http://localhost:3000](http://localhost:3000)

That's it!

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.