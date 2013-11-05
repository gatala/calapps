class Calapp < ActiveRecord::Base
	#belongs_to :user

	validates :name, :presence => true, length: {:within => 3..25}, 
  			uniqueness: { case_sensitive: false }

	validates :creator, :presence => true

	validates :URL, :presence => true, 
  			uniqueness: { case_sensitive: false }

end