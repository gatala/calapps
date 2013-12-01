class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :app_id
      t.integer :review_user
      t.string :review_text
      t.integer :review_rating
      t.boolean :review_flag
      t.timestamp :review_timestamp

      t.timestamps
    end
  end
end
