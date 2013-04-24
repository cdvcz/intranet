FactoryGirl.define do
  factory :employee do
    sequence(:number) {|i| "employee#{i}" }
    first_name "Jan"
    surname "Hus"
    job "kazatel"
    sequence(:email) {|i| "employee#{i}@cdv.cz" }
    employed_from { 1.year.ago }
  end
end
