class AddScreenshot5ToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :screenshot5, :string
  end
end
