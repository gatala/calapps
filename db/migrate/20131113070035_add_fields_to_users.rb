class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school, :string
    add_column :users, :year, :integer
    add_column :users, :github, :string
    add_column :users, :major, :string
  end
end
