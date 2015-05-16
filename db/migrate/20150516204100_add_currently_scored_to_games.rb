class AddCurrentlyScoredToGames < ActiveRecord::Migration
  def change
    add_column :games, :currently_scored, :integer
  end
end
