class AddUserEmailToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :user_email, :string
  end
end
