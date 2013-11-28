class AddThumbnailToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :image, :string
  end
end
