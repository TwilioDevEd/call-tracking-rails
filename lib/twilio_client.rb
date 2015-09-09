class TwilioClient
  def self.available_phone_numbers(area_code)
    new.available_phone_numbers(area_code)
  end

  def initialize
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def available_phone_numbers(area_code = '415')
   client.available_phone_numbers.
     get('US').local.list(area_code: area_code).take(10)
  end

  def purchase_phone_number(phone_number)
    client.available_phone_numbers.
      purchase(phone_number: phone_number, voice_application_sid: ENV['TWIML_APPLICATION_SID'])
  end

  private

  attr_reader :client
end
