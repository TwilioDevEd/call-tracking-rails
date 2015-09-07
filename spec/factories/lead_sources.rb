FactoryGirl.define do
  factory :lead_source do
    name "Lead Source"
    incoming_number "+15555555555"

    trait :without_name do
      name nil
    end
  end
end
