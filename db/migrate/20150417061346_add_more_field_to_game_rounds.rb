class AddMoreFieldToGameRounds < ActiveRecord::Migration
  def change
	add_column :game_rounds, :firstname, :string
    add_column :game_rounds, :lastname, :string
    add_column :game_rounds, :city, :string
    add_column :game_rounds, :country, :string
    add_column :game_rounds, :fruit, :string
    add_column :game_rounds, :car, :string
    add_column :game_rounds, :color, :string
    add_column :game_rounds, :job, :string
    add_column :game_rounds, :food, :string
    add_column :game_rounds, :thing, :string
    add_column :game_rounds, :animal, :string
    add_column :game_rounds, :flower, :string
    add_column :game_rounds, :round_number, :integer
	add_column :game_rounds, :user_game_id, :integer
  end
end
