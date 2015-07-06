FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password 'xsw2zaq1'
  end

end
