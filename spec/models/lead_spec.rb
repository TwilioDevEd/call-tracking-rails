require 'rails_helper'

RSpec.describe Lead do
  describe ".count_by_city" do
    it "counts leads grouped by city" do
      create_list(:lead, 2, city: "San Diego")

      expect(described_class.count_by_city).to eq({"San Diego" => 2})
    end
  end

  describe "#to_str" do
    it "shows the city and the state" do
      lead_source = build(:lead_source)
      lead = build(:lead, lead_source: lead_source)

      expect(lead.to_str).to eq("San Diego, California")
    end
  end
end

