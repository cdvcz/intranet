FactoryGirl.define do
  factory :demand do
    status "1"
    sequence(:number) {|i| "demand#{i}" }
    name "Baterie"
    tax_year Time.now.year
    description "Baterie pro notebook HP"
    price "599"
  end
end