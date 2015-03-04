class UserGame < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	has_many :game_rounds
end
