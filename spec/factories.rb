require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobarfoo"
    password_confirmation "foobarfoo"
  end
end