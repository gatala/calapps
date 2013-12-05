class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :app_id
      t.string :review_user
      t.string :review_text
      t.integer :review_rating
      t.boolean :review_flag
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
