class LeadsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    lead = Lead.create(lead_params)
    forward_call(lead.phone_number)
  end

  private

  def forward_call(phone_number)
    response = Twilio::TwiML::Response.new do |r|
      r.Dial phone_number
    end

    render text: response.text
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
