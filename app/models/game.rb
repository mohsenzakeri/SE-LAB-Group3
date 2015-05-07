class Game < ActiveRecord::Base
	belongs_to :user
	has_many :user_games, :dependent => :destroy
	has_many :game_alphabets, :dependent => :destroy
end
