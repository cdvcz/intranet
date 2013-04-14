FactoryGirl.define do
  factory :user do
    login_username "hus"
    password "abc123"

    first_name "Jan"
    last_name  "Hus"

    factory :disabled_user do
      login_allowed false
    end
  end

end
