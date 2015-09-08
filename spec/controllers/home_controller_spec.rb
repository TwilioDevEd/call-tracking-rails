require 'rails_helper'

describe HomeController do
  it 'assigns lead sources' do
    lead_source = double('Lead Source')
    allow(LeadSource).to receive(:all) { [lead_source] }

    get :index
    expect(assigns(:lead_sources)).to eq([lead_source])
  end
end
