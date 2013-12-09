class AddScreenshot2ToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :screenshot2, :string
  end
end
