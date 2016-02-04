class ChangeColumnNameImagesToImageInImages < ActiveRecord::Migration
  def change
  	 rename_column :images, :images, :image
  end
end
