FactoryGirl.define do
  factory :todo do
    user
    sequence(:title) {|n| "Example title #{n}"}
    description "MyText"
    completion 10
    trait :completed do
      completion 100
    end
    trait :without_title do
      title ''
    end
  end

end
