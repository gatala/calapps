class Review < ActiveRecord::Base
  attr_accessible :app_id, :created_at, :review_flag, :review_rating, :review_text, :review_user, :updated_at

  belongs_to :app_id
  belongs_to :review_user

  validates_inclusion_of :review_rating, :in => [1, 2, 3, 4, 5]
  validates :app_id, presence: true
  validates :review_user, presence: true
  validates :review_rating, presence: true

end
