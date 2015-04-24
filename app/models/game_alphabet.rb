class GameAlphabet < ActiveRecord::Base
	belongs_to :game

	def self.new_game_alphabet(_game_id,_round_number,_alphabet)
		@game_alphabet = GameAlphabet.create(:game_id=>_game_id, :round_number=>_round_number, :alphabet=>_alphabet)	
	end
end
