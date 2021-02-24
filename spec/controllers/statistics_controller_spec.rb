require 'rails_helper'

describe StatisticsController do
  describe '#leads_by_source' do
    it 'returns lead sources grouped by leads' do
      lead_sources = {"Downtown" => 3, "Smalltown" => 1}
      allow(LeadSource).to receive(:count_leads).and_return(lead_sources)

      get :leads_by_source
      hash_response = JSON.parse(response.body)
      datasets = hash_response["datasets"]
      labels = hash_response["labels"]
      expect(datasets.length).to be(1)
      expect(datasets.first).to include("data" => [3, 1])
      expect(labels).to eq(["Downtown", "Smalltown"])
    end
  end

  describe '#leads_by_city' do
    it 'returns lead sources grouped by city' do
      leads = {"San Diego" => 1, "Modesto" => 2}
      allow(Lead).to receive(:count_by_city).and_return(leads)

      get :leads_by_city
      hash_response = JSON.parse(response.body)
      datasets = hash_response["datasets"]
      labels = hash_response["labels"]
      expect(datasets.length).to be(1)
      expect(datasets.first).to include("data" => [1, 2])
      expect(labels).to eq ["San Diego", "Modesto"]
    end
  end
end
