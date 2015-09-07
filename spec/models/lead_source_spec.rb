require 'rails_helper'

RSpec.describe LeadSource do
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

