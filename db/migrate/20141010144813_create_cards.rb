class CreateCards < ActiveRecord::Migration
  def change
  	create_table :cards do |t|
  		t.integer :deck_id
  		t.text :hint
  		t.string :answer
  		t.string :link
  		t.string :year
  		t.string :image_url

  		t.timestamps
  	end
  end
end
