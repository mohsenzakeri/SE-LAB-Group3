class UserGame < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	has_many :game_rounds, :dependent => :destroy

	def self.create_user_game(u,g)
	  @user_game = UserGame.create(:user=>u, :game=>g, :round_number => 1)
	end
end
