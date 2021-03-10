require 'twilio-ruby'
require 'vcr'
require 'vcr_helper'
require_relative '../../lib/twilio_client'

describe TwilioClient do
  describe '.available_phone_numbers' do
    it "returns the first 10 phone numbers" do
      VCR.use_cassette('available-phone-numbers', match_requests_on: [:method, :uri_regex]) do
        phone_numbers = described_class.available_phone_numbers('415')
        expect(phone_numbers.count).to eq(10)
      end
    end
  end

  describe '.purchase_phone_number' do
    it 'purchases a phone number' do
      VCR.use_cassette('purchase-phone-number', match_requests_on: [:method, :uri_regex]) do
        phone_number = described_class.purchase_phone_number('+14152339867')
        expect(phone_number.friendly_name).to_not be_empty
      end
    end
  end
end
