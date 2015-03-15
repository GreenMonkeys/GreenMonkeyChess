FactoryGirl.define do

  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end

    password "passpassword1"
    password_confirmation "passpassword1"
  end
  
  factory :game do
  	name "tough game"
  end
end
