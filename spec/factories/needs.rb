FactoryGirl.define do
  factory :need do
    
    description { FFaker::HipsterIpsum.phrase }
    headline { FFaker::HipsterIpsum.phrase }
    user
  end

end
