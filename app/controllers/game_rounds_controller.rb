class GameRoundsController < ApplicationController
  before_action :set_game_round, only: [:show, :edit, :update, :destroy]

  # GET /game_rounds
  # GET /game_rounds.json
  def index
    @game_rounds = GameRound.all
  end

  # GET /game_rounds/1
  # GET /game_rounds/1.json
  def show
  end

  # GET /game_rounds/new
  def new
    @game_round = GameRound.new
    @user_game = UserGame.where(:game=>Game.find(params[:gameid]), :user=>current_user).first
    @game_alphabet = GameAlphabet.where(:game=>Game.find(params[:gameid]),:round_number=>@user_game.game_rounds.count+1).first
    @user_game.round_number = @user_game.game_rounds.count + 1;
    @user_game.save;
  end

  # GET /game_rounds/1/edit
  def edit
  end

  # POST /game_rounds
  # POST /game_rounds.json
  def create
    @game_round = GameRound.new(game_round_params)
    
    
    
    

    respond_to do |format|
      if @game_round.save
        PrivatePub.publish_to("/user_games/stop_game/#{@game_round.user_game.game_id}" , 
          "$('input').click(function(){ $('#playgame_form').attr('data-remote',true)}); 
          game_finished = true;
          validate();
          $('#stop_game').click(); ")
        
        @user_game = @game_round.user_game
        @game = @user_game.game
	user_games = @game.user_games
 	user_games.sort! { |a,b| a.id <=> b.id }
	count1 = @user_game.game_rounds.count
	count3 = @game.user_games.count
	randomization = count1
	my_index = 0
	user_games.each_with_index do |user_game,index|
		if(user_game.id == @user_game.id )
			my_index = index
		end	
	end
	random_index = my_index+randomization
	if random_index >= count3
		random_index = random_index%count3
	end
	if random_index == my_index
		if random_index<count3-1
			random_index += 1
		else
			random_index = 0
		end	
	end
	random_id = user_games[random_index].id

#        random_id = @game.user_games.find_by_id(@user_game.id).id




        
        format.html { redirect_to new_game_judge_path(:judge_id=>random_id), notice: 'این دور از بازی به اتمام رسید.' }
        format.json { render action: 'show', status: :created, location: @game_round }
      else
        format.html { render action: 'new' }
        format.json { render json: @game_round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_rounds/1
  # PATCH/PUT /game_rounds/1.json
  def update
    respond_to do |format|
      if @game_round.update(game_round_params)
        format.html { redirect_to @game_round, notice: 'Game round was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game_round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_rounds/1
  # DELETE /game_rounds/1.json
  def destroy
    @game_round.destroy
    respond_to do |format|
      format.html { redirect_to game_rounds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_round
      @game_round = GameRound.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_round_params
        params.require(:game_round).permit(:round_number, :user_game_id, :firstname, :lastname, :city, :country, :fruit, :car, :color, :job, :food, :thing, :animal, :flower)
    end
end
