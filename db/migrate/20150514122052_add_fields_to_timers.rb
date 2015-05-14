class AddFieldsToTimers < ActiveRecord::Migration
  def change
  	add_column("timers", "game_id", :integer)
  	add_column("timers", "round_number", :integer)
  	add_column("timers", "value", :integer)

  end
end
