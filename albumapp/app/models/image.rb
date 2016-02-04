class Image < ActiveRecord::Base
	belongs_to :album
	mount_uploader :image, ImageUploader
end
