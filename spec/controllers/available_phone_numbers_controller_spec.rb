require 'rails_helper'

describe AvailablePhoneNumbersController do
  describe '#index' do
    it 'assings the available numbers' do
      area_code = "415"
      available_number = double("Available Number")
      allow(TwilioClient).to receive(:available_phone_numbers).with(area_code) {[available_number]}

      get :index, "area-code" => area_code
      expect(assigns(:phone_numbers)).to eq [available_number]
    end
  end
end
