FactoryGirl.define do
  factory :employee do
    association :person
    date_from { 1.year.ago }
  end
end
