class Add2moreFieldToGameRounds < ActiveRecord::Migration
  def change
    add_column :game_rounds, :round_number, :integer
    add_column :game_rounds, :user_game_id, :integer
  end
end
