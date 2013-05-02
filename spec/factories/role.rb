FactoryGirl.define do
  factory :role do
    sequence(:code) {|i| "user#{i}"}
    sequence(:name) {|i| "Uzivatel #1" }

    factory :admin_role do
      code "admin"
      name "Administrator"
    end
  end
end
