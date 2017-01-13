FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password 'password'
    bio { FFaker::HipsterIpsum.paragraph }
    zipcode { FFaker::AddressUS.zip_code }
  

    factory :admin do 
      transient do
        group { create(:group) }  
      end
      after(:create) do |user, evaluator|
        evaluator.group.set_admin(user)
      end
    end

    factory :user_with_needs do
      transient do
        need { create(:need) }
        group { create(:group) }
      end

      after(:create) do |user, e|
        user.join_group( e.group )
        e.need.groups << e.group
        e.need.user = user
        e.need.save
      end
    end

  end
end
