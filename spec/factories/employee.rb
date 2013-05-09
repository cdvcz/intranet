FactoryGirl.define do
  factory :employee do
    sequence(:number) {|i| "employee#{i}" }
    date_from { 1.year.ago }
  end
end