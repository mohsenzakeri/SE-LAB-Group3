class AddFieldsToRound < ActiveRecord::Migration
  def change
  	add_column("rounds","game_id","integer")
  	add_column("rounds","gameround_id","integer")
  	add_column("rounds","alphabet","string")
  end
end
