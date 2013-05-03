FactoryGirl.define do
  factory :user do
    login "hus"
    password "abc123"

    name "Jan Hus"

    factory :disabled_user do
      login_allowed false
    end
  end
end
