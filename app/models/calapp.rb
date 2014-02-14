class Calapp < ActiveRecord::Base
	#belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  scope :approved, -> { where(approved: true) }
  scope :pending, -> { where(approved: false) }
  scope :name_search, lambda {|name| where("upper(name) like ?", name)}
  scope :creator_search, lambda {|creator| where("upper(creator) like ?", creator)}
  scope :description_search, lambda {|description| where("upper(description) like ?", description)}
  scope :category_search, lambda {|category| where("upper(category) like ?", category)}

	attr_accessible  :name, :URL, :creator, :description, :tag_list, :created_location, 
    :user_email, :category, :image, :screenshot1, :screenshot2, :screenshot3, :screenshot4, 
    :screenshot5

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

  mount_uploader :screenshot1, ImageUploader
  mount_uploader :screenshot2, ImageUploader
  mount_uploader :screenshot3, ImageUploader
  mount_uploader :screenshot4, ImageUploader
  mount_uploader :screenshot5, ImageUploader
    
end

