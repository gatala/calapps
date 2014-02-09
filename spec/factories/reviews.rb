# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    app_id 1
    review_user "MyString"
    review_text "MyString"
    review_rating 1
    review_flag false
    created_at "2013-12-05 11:17:50"
    updated_at "2013-12-05 11:17:50"
  end
end
