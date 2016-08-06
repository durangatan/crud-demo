class CreateEntries < ActiveRecord::Migration
  def change
  	create_table :entries do |t|
  		t.string :title
  		t.string :content
  		t.integer :author_id
  		
  		t.timestamps
  	end
  end
end
