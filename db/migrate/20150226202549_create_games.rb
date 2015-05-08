class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :creator_id
      t.integer :players_num
      t.integer :rounds_num
      t.integer :joined_players
      t.integer :currently_scored
      t.timestamps
    end
  end
end
