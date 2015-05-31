class Timer < ActiveRecord::Base
	belongs_to :game

	def self.new_timer(_game_id,_round_number)
		@timer = Timer.create(:game_id=>_game_id, :round_number=>_round_number, :value=>7)	
	end
end
