class AddRoundNumberToUserGame < ActiveRecord::Migration
  def change
    add_column :user_games, :round_number, :integer
  end
end
