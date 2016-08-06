class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :content
  		t.integer :entry_id
  		t.integer :author_id

  		t.timestamps
  	end
  end
end
