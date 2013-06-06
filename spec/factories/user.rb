FactoryGirl.define do
  factory :user do
    name "Jan Hus"

    factory :disabled_user do
      login_allowed false
    end
  end
end
