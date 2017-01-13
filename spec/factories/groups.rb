FactoryGirl.define do
  factory :group do
    title { FFaker::HipsterIpsum.phrase }
    description { FFaker::HipsterIpsum.sentences(3).join(" ") }
    open true

    factory :closed do
      open false
    end

  end
end  