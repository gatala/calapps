class AddCategoryToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :category, :string
  end
end
