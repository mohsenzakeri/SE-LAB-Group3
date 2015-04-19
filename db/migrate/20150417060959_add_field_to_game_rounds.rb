class AddFieldToGameRounds < ActiveRecord::Migration
  def change
    add_column :game_rounds, :firstname, :string
  end
end
