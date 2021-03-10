require 'rails_helper'

describe LeadSourcesController do
  describe "#edit" do
    it 'assings a lead source' do
      params = { id: "1" }
      lead_source = double("Lead Source")
      allow(LeadSource).to receive(:find).with(params[:id]) { lead_source }

      get :edit, params: params
      expect(assigns(:lead_source)).to eq lead_source
    end
  end

  describe "#create" do
    let(:twilio_number) do
      double('Twilio Number',
             friendly_name: '(256) 841-7275')
    end

    before do
      allow(TwilioClient).to receive(:purchase_phone_number) { twilio_number }
    end

    it "creates a lead source" do
      expect do
        post :create, format: '+12568417275'
      end.to change(LeadSource, :count).by(1)
    end

    it "redirects to lead source edit url" do
      post :create, params: { format: '+12568417275' }
      expect(response).to redirect_to edit_lead_source_path(LeadSource.last)
    end
  end

  describe "#update" do
    let(:lead_source) { create(:lead_source, name: "Downtown") }

    it 'updates the lead source' do
      put :update, params: { id: lead_source.id, lead_source: {name: "Smalltown"} }
      expect(lead_source.reload.name).to eq("Smalltown")
    end

    it 'redirects to root' do
      put :update, params: { id: lead_source.id, lead_source: {name: "Smalltown"} }
      expect(response).to redirect_to root_url
    end
  end
end
