class AddCreatedLocationToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :created_location, :string
  end
end
