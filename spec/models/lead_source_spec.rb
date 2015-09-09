require 'rails_helper'

RSpec.describe LeadSource do
  describe '.count_leads' do
    it "counts leads grouped by Lead Source" do
      downtown = create(:lead_source, name: "Downtown")
      create_list(:lead, 2, lead_source: downtown)

      expect(described_class.count_leads).to eq({"Downtown" => 2})
    end
  end

  describe "#to_str" do
    context "when name is present" do
      it "shows the name and the incoming number" do
        lead_source = build(:lead_source)

        expect(lead_source.to_str).to eq('Lead Source - +15555555555')
      end
    end

    context "when name is not present" do
      it "shows a placeholder for the name and the incoming number" do
        lead_source = build(:lead_source, :without_name)

        expect(lead_source.to_str).to eq('(no yet named) - +15555555555')
      end
    end
  end
end

