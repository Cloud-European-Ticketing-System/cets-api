FactoryGirl.define do
  factory :company do
    name 'Test Company'
    association :location, factory: :location
  end
end
