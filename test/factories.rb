FactoryGirl.define do
  factory :user do
    email "jane.doe@greatchess.com"
    password "passpassword1"
    password_confirmation "passpassword1"
  end

  factory :game do
  	name "tough game"
  end
end