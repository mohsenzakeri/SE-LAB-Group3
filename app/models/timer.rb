class Timer < ActiveRecord::Base
	belongs_to :game

	def self.new_timer(_game_id,_round_number)
		@timer = Timer.create(:game_id=>_game_id, :round_number=>_round_number, :value=>7)	
	end

	def self.delete_game_timers(_game_id)
		@the_game_timers = Timer.where(:game_id=>_game_id)
		@the_game_timers.each do |timer|
			timer.destroy
		end
	end

end
