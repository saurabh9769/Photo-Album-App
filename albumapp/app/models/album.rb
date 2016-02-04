class Album < ActiveRecord::Base
	
	belongs_to :user
	has_many :images
	mount_uploader :thumbnail,ImageUploader
end
