require 'factory_girl'

FactoryGirl.define do
  factory :page do
    title { Forgery::Name.full_name }
    body 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'
    updated_by_id { create(:user).id }
  end

  factory :user do
    name { Forgery::Name.full_name }
    email { Forgery::Internet.email_address }
    password 'secret123'
    password_confirmation 'secret123'
  end
end
