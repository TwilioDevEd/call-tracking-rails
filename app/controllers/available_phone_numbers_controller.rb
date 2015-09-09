class AvailablePhoneNumbersController < ApplicationController
  def index
    area_code = params[:area_code]
    # TwilioClient is a thin wrapper for Twilio::REST::Client
    @phone_numbers = ::TwilioClient.available_phone_numbers(area_code)
  end
end
