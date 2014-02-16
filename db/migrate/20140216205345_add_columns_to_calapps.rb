class AddColumnsToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :news, :text
    add_column :calapps, :campus_approved, :boolean, default: false
  end
end
