require 'rails_helper'

RSpec.describe Lead do
  describe "#to_str" do
    it "shows the city and the state" do
      lead_source = build(:lead_source)
      lead = build(:lead, lead_source: lead_source)

      expect(lead.to_str).to eq("San Diego, California")
    end
  end

  describe ".by_city" do
    it "gets leads by city" do
      lead_source = create(:lead_source)
      modesto_lead = create(:lead, lead_source: lead_source, city: "Modesto")
      fontana_lead = create(:lead, lead_source: lead_source, city: "Fontana")

      expect(Lead.by_city("Modesto").map(&:id)).to eq([modesto_lead.id])
    end
  end
end

