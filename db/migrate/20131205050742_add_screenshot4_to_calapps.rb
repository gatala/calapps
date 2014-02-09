class AddScreenshot4ToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :screenshot4, :string
  end
end
