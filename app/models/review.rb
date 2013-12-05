class Review < ActiveRecord::Base
  attr_accessible :app_id, :created_at, :review_flag, :review_rating, :review_text, :review_user, :updated_at
end
