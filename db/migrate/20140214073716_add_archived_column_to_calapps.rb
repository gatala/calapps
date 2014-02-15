class AddArchivedColumnToCalapps < ActiveRecord::Migration
  def change
    add_column :calapps, :archived, :boolean, default: false
  end
end
