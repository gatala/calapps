class Reviews < ActiveRecord::Base
  attr_accessible :app_id, :review_flag, :review_rating, :review_text, :review_timestamp, :review_user
end
