FactoryGirl.define do
  factory :membership do 
    association :group
    association :user
    admin :false
  end
end