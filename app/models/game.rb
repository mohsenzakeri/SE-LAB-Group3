class Game < ActiveRecord::Base
	belongs_to :user
	has_many :user_games
	has_many :game_alphabets
end
