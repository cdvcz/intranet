FactoryGirl.define do
  factory :role do
    sequence(:code) {|i| "user#{i}"}
    sequence(:name) {|i| "Uzivatel #{i}" }

    factory :admin_role do
      sequence(:code) {|i| "admin#{i}" }
      sequence(:name) {|i| "Administrator#{i}" }
    end
  end
end
