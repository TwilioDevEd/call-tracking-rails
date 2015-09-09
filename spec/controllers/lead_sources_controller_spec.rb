require 'rails_helper'

describe LeadSourcesController do
  describe "#edit" do
    it 'assings a lead source' do
      params = {id: "1"}
      lead_source = double("Lead Source")
      allow(LeadSource).to receive(:find).with(params[:id]) { lead_source }

      get :edit, id: params[:id]
      expect(assigns(:lead_source)).to eq lead_source
    end
  end

  describe "#update" do
    let(:lead_source) { create(:lead_source, name: "Downtown") }

    it 'updates the lead source' do
      put :update, id: lead_source.id, lead_source: {name: "Smalltown"}
      expect(lead_source.reload.name).to eq("Smalltown")
    end

    it 'redirects to root' do
      put :update, id: lead_source.id, lead_source: {name: "Smalltown"}
      expect(response).to redirect_to root_url
    end
  end
end
