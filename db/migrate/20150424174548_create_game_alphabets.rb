class CreateGameAlphabets < ActiveRecord::Migration
  def change
    create_table :game_alphabets do |t|
      t.integer :game_id
      t.integer :round_number
      t.string :alphabet

      t.timestamps
    end
  end
end
