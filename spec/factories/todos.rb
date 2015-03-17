FactoryGirl.define do
  factory :todo do
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
