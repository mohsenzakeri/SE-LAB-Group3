class GameAlphabet < ActiveRecord::Base
	belongs_to :game

	def self.new_game_alphabet(_game_id,_round_number,_alphabet)
		@game_alphabet = GameAlphabet.create(:game_id=>_game_id, :round_number=>_round_number, :alphabet=>_alphabet)	
	end
	
	def self.delete_game_alphabets(_gma_id)
		@the_game_alphabets = GameAlphabet.where( :game_id => _game_id)
		@the_game_alphabets.destroy
	end
end
