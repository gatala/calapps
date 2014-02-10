class AddApprovedColumnToCalApps < ActiveRecord::Migration
  def change
    add_column :calapps, :approved, :boolean, default: false
  end
end
