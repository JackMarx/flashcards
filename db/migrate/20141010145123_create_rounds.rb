class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  		t.integer :user_id
  		t.integer :deck_id
  		t.integer :correct_guesses, default: 0
  		t.boolean :finished, default: false

  		t.timestamps
  	end
  end
end
