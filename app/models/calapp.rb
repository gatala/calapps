class Calapp < ActiveRecord::Base
	#belongs_to :user

	attr_accessible  :name, :URL, :creator, :description, :tag_list, :created_location

	acts_as_taggable 

	validates :name, :presence => true, length: {:within => 3..25}, 
  			uniqueness: { case_sensitive: false }

	validates :creator, :presence => true

	validates :URL, :presence => true, 
  			uniqueness: { case_sensitive: false }

  	belongs_to :user
  	validates :user_email, :presence => true

end