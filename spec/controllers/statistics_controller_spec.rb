require 'rails_helper'

describe StatisticsController do
  describe '#leads_by_source' do
    it 'returns lead sources grouped by leads' do
      lead_sources = {"Downtown" => 3, "Smalltown" => 1}
      allow(LeadSource).to receive(:count_leads).and_return(lead_sources)

      get :leads_by_source
      expect(response.body).to eq [{label: "Downtown", value:3}, {label: "Smalltown", value: 1}].to_json
    end
  end

  describe '#leads_by_city' do
    it 'returns lead sources grouped by city' do
      leads = {"San Diego" => 1, "Modesto" => 2}
      allow(Lead).to receive(:count_by_city).and_return(leads)

      get :leads_by_city
      expect(response.body).to eq [{label: "San Diego", value: 1}, {label: "Modesto", value: 2}].to_json
    end
  end
end
