class AddCalAppIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :calapp_id, :integer
  end
end
