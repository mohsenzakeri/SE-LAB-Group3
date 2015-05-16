class GameRound < ActiveRecord::Base
	belongs_to :user_game
	has_one :game_judge, :dependent => :destroy		

	def self.new_game_round( _firstname,_lastname,_city,_country,_fruit,_car,_color,_job,_food,_thing,_animal,_flower,_round_number,user_game)
	  @game_round = GameRound.create(:firstname=>_firstname, :lastname=>_lastname, :city=>_city, :country=>_country, :fruit=>_fruit, 
:car=>_car, :color=>_color, :job=>_job, :food=>_food, :thing=>_thing, :animal=>_animal, :flower=>_flower, :round_number=>_round_number, 
:user_game_id=>user_game)	
	end
end
