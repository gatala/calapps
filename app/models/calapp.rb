class Calapp < ActiveRecord::Base
	#belongs_to :user

	validates_uniqueness_of :name

	validates :name, :presence => true, length: {:within => 3..25}

	#VALID_URL_REGEX = /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

	#validates :URL, :presence => true, 
  	#				format: { with: VALID_URL_REGEX },
  	#				uniqueness: { case_sensitive: false }

end