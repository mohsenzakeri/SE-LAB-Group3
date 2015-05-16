class CreateGameRounds < ActiveRecord::Migration
  def change
    create_table :game_rounds do |t|
	  t.integer :score
	  t.integer :round_number
	  t.integer :user_game_id
	  t.string :firstname
	  t.string :lastname
	  t.string :city
          t.string :country
          t.string :fruit
          t.string :thing
          t.string :animal
	  t.string :flower

      t.timestamps
    end
  end
end
