class Round < ActiveRecord::Base
	belongs_to :game
	has_many :game_rounds
end
