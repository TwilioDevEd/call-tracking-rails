FactoryBot.define do
  factory :lead do
    association :lead_source
    phone_number { "+18888888888" }
    city { "San Diego" }
    state { "California" }
  end
end
