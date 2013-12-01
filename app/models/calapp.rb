class Calapp < ActiveRecord::Base
	#belongs_to :user

	attr_accessible  :name, :URL, :creator, :description, :tag_list, :created_location, :user_email, :category, :image

	#For tagging
	acts_as_taggable 

	#For validating the name of the actual application
	validates :name, :presence => true, length: {:within => 3..25}, 
  			uniqueness: { case_sensitive: false }

  	#For validating that there is a creator for the application
	validates :creator, :presence => true

	#For validatidating that there must be a cateogry for the application be filed in
	validates :category, :presence => true, inclusion: { in: %w(Academic Career Collaboration Commerce Food Health Miscellaneous Multipurpose Mobile),
    message: "%{value} is not a valid category" }

    #For validating there must be an actual URL 
	validates :URL, :presence => true, 
  			uniqueness: { case_sensitive: false }

  	#For the uploading of the thumbnail
  	mount_uploader :image, ImageUploader

end

