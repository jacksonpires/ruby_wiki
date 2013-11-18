require 'factory_girl'

FactoryGirl.define do
  factory :page do
    title { Forgery::Name.full_name }
    body 'Lorem ipsum dolor sit amet, consectetur adipisicing elit'
  end
end
