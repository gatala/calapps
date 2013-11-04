class Calapp < ActiveRecord::Base
	#belongs_to :user

	validates_uniqueness_of :name

	validates :name, :presence => true, length: {:within => 3..25}

	validates :creator, :presence => true

	validates :URL, :presence => true, 
  			uniqueness: { case_sensitive: false }

end