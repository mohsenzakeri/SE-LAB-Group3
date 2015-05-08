class CreateGameRounds < ActiveRecord::Migration
  def change
    create_table :game_rounds do |t|
	  t.integer :score
      t.timestamps
    end
  end
end
