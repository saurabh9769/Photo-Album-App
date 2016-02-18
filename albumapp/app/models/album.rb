class Album < ActiveRecord::Base
	
	belongs_to :user
	has_many :images
	# has_one :user
	mount_uploader :thumbnail,ImageUploader
end
