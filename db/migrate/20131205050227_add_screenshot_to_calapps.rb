class AddScreenshotToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :screenshot1, :string
  end
end
