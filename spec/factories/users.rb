FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'xsw2zaq1'
  end

  factory :confirmed_user do
    confirmet_at Time.zone.now
  end

end
