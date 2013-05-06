FactoryGirl.define do
  factory :unit do
    sequence(:name) { |i| "Unit#{i}" }
    sequence(:abbreviation) { |i| "U#{i}" }
  end
end
