class RemoveAppIdFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :app_id
  end

  def down
    add_column :reviews, :app_id, :integer
  end
end
