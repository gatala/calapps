class RemoveReviewUserFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :review_user
  end

  def down
    add_column :reviews, :review_user, :string
  end
end
