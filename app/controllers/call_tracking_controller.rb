class CallTrackingController < ApplicationController
  skip_before_action :verify_authenticity_token

  def forward_call
    lead = Lead.create(lead_params)
    render text: twilio_response.text
  end

  private

  def twilio_response
    phone_number = lead_source.forwarding_number

    Twilio::TwiML::Response.new do |r|
      r.Dial phone_number
    end
  end

  def lead_params
    {
      lead_source: lead_source,
      phone_number: params[:Caller],
      city: params[:FromCity],
      state: params[:FromState],
    }
  end

  def lead_source
    incoming_number = GlobalPhone.parse(params[:Called]).national_format
    LeadSource.find_by_incoming_number(incoming_number)
  end
end
