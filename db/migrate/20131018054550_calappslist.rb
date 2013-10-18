class Calappslist < ActiveRecord::Migration
  def up
  	create_table :calapps do |t|
  		t.string 	:name 
  		t.string 	:URL
  		t.string 	:creator
  		t.text		:description

  		t.timestamps
  	end
  end

  def down
  	drop_table :calapps
  end
end
