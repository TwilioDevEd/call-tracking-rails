<a  href="https://www.twilio.com">
<img  src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg"  alt="Twilio"  width="250"  />
</a>
 
# Call Tracking - Rails

![](https://github.com/TwilioDevEd/call-tracking-rails/workflows/build/badge.svg)

## About

Use Twilio to track the effectiveness of your different marketing campaigns. Learn how call tracking helps organizations in [these Twilio customer stories](https://www.twilio.com/use-cases/call-tracking).

[Read the full tutorial here](https://www.twilio.com/docs/tutorials/walkthrough/call-tracking/ruby/rails)!

## Local development

This project is built using [Ruby on Rails](http://rubyonrails.org/) and [NodeJS](https://nodejs.org/en/) Frameworks.

1. First clone this repository and `cd` into it.

   ```
   $ git clone git@github.com:TwilioDevEd/call-tracking-rails.git
   $ cd call-tracking-rails
   ```

1. Install Rails the dependencies.
   ```
   $ bundle install
   ```

1. Install Webpack the dependencies.
   ```
   $ npm install
   ```

1. Expose your application to the wider internet using [ngrok](http://ngrok.com). This step is important because the application won't work as expected if you run it through localhost.
   ```bash
   $ ngrok http 3000
   ```

   Your ngrok URL should look something like this: `http://9a159ccf.ngrok.io`

   You can read [this blog post](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html)
   for more details on how to use ngrok.

1. Configure your Twilio App to call your webhook.

   Before you can run this app you need to go into your account portal and [create a new Twilio Application](https://www.twilio.com/console/phone-numbers/runtime/twiml-apps). Once you have created an app the urls should look like:

   Voice: `https://<ngrok_subdomain>.ngrok.io/call-tracking/forward-call`

   SMS & MMS: doesn't matter

   You can learn more about TwiML apps [here](https://www.twilio.com/help/faq/twilio-client/how-do-i-create-a-twiml-app).

1. Copy the sample configuration file and edit it to match your configuration.

   ```bash
   $ cp .env.example .env
   ```

   You can find your `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN` in your
   [Twilio Account Settings](https://www.twilio.com/console/account/settings).
   You will also need a `TWIML_APPLICATION_SID`, which you may find [here](https://www.twilio.com/console/phone-numbers/runtime/twiml-apps). The webhooks can be left empty as they will be configured later.

1. Create database and run migrations.

   _Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on a Mac, I recommend [Postgres.app](http://postgresapp.com)_

   ```bash
   $ bundle exec rails db:setup
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

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](LICENSE)
* Lovingly crafted by Twilio Developer Education.
