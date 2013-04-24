FactoryGirl.define do
  factory :subject do
    name "Subjekt"
    sequence(:registration_number) {|i| "r#{i}" }
  end
end
