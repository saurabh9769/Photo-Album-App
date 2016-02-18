class Album < ActiveRecord::Base

	# attr_accessible :name, :title, :image
  	mount_uploader :image, ImageUploader
	# accepts_nested_attributes_for , allow_destroy: true

	validates_processing_of :image
	validate :image_size_validation

  private
  def image_size_validation
    errors[:image] << "should be less than 1mb" if image.size > 1.megabytes
  end
end
