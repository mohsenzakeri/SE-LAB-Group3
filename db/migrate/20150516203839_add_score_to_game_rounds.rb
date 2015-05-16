class AddScoreToGameRounds < ActiveRecord::Migration
  def change
    add_column :game_rounds, :score, :integer
  end
end
