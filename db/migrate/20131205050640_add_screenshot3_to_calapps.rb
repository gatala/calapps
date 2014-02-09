class AddScreenshot3ToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :screenshot3, :string
  end
end
