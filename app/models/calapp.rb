class Calapp < ActiveRecord::Base
	#belongs_to :user

	attr_accessible  :name, :URL, :creator, :description, :tag_list, :created_location, :user_email, :category

	acts_as_taggable 

	validates :name, :presence => true, length: {:within => 3..25}, 
  			uniqueness: { case_sensitive: false }

	validates :creator, :presence => true

	validates :category, :presence => true, inclusion: { in: %w(Academic Career Collaboration Commerce Food Health Miscellaneous Multipurpose),
    message: "%{value} is not a valid category" }

	validates :URL, :presence => true, 
  			uniqueness: { case_sensitive: false }

end

