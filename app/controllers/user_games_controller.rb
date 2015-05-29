# encoding: UTF-8
class UserGamesController < ApplicationController
  before_action :set_user_game, only: [:show, :edit, :update, :destroy, :new_game_round]
  load_and_authorize_resource
  # GET /user_games
  # GET /user_games.json
  def index
    @user_games = UserGame.all
    
  end

  # GET /user_games/1
  # GET /user_games/1.json
  def show
    @current_timer = Timer.where(:game=>Game.find(@user_game.game_id),:round_number=>(@user_game.game_rounds.count+1)).first
  end

  # GET /user_games/new
  def new
    @user_game = UserGame.new
  end

  # GET /user_games/1/edit
  def edit
  end

  # POST /user_games
  # POST /user_games.json
  def create
    @user_game = UserGame.new
    @user_game.user_id = current_user.id
    @user_game.game_id = params[:game_id]
    @user_game.score = 0
    @user_game.round_number = 1
    @game = Game.find(params[:game_id])
    #Niloofar Added
    num = @game.joined_players
    @game.joined_players = num + 1
    @game.save


    gon.game_id = @game.id

    respond_to do |format|
      if @user_game.save
        # PrivatePub.publish_to("/user_games/new/private/#{@game.id}" , "alert( 'کاربر ' +'#{@user_game.user.nickname}' + ' به بازی شما ملحق شد.');")
        
        # if @game.joined_players == @game.players_num
        #   PrivatePub.publish_to("/start_game/#{@game.id}" , 'بازی شروع شد')
        #   format.js
        #   format.html { redirect_to {'/home/index'} }
        #   format.json { render action: 'show', status: :created, location: @user_game }
        # else
          # PrivatePub.publish_to("/user_games/new/private/#{@game.id}" , "alert( 'کاربر ' +'#{@user_game.user.nickname}' + ' به بازی شما ملحق شد.');")
          PrivatePub.publish_to("/user_games/new/private/#{@game.id}" , "notice( 'کاربر ' +'#{@user_game.user.nickname}' + ' به بازی شما ملحق شد.');")
          format.js
          if @game.joined_players == @game.players_num
            PrivatePub.publish_to("/user_games/start_game/#{@game.id}" , "window.location.replace('/user_games/#{@user_game.id}');")
            format.html { redirect_to home_path, alert: 'User game was successfully created.' }
          else
            format.html { redirect_to @user_game, notice: 'User game was successfully created.' }
          end
          format.json { render action: 'show', status: :created, location: @user_game }
          # if @game.joined_players == @game.players_num
          #   PrivatePub.publish_to("/user_games/start_game/#{@game.id}" , "window.location.replace('/home');")
          #   redirect_to home_path
          #   # byebug
          # end
        #end
      else
        format.html { render action: 'new' }
        format.json { render json: @user_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_games/1
  # PATCH/PUT /user_games/1.json
  def update
    respond_to do |format|
      if @user_game.update(user_game_params)
        format.html { redirect_to @user_game, notice: 'User game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_games/1
  # DELETE /user_games/1.json
  def destroy
    @game = Game.find(@user_game.game.id)
    @user_game.destroy
    #Niloofar Added
    num = @game.joined_players
    @game.joined_players = num - 1
    @game.save


    respond_to do |format| 
      PrivatePub.publish_to("/user_games/new/private/#{@game.id}" , "alert('کاربر '+'#{@user_game.user.nickname}' + ' از بازی شما خارج شد.');")        
      format.js
      format.html { redirect_to @game }
      format.json { head :no_content }
    end
  end

  #Mohsen Added this function for creating game_round, but this is now moved to game_round controller!
#   def new_game_round

#     @_firstname=params["firstname"]
#     @_lastname=params["lastname"]
#     @_city=params["city"]
#     @_country=params["country"]
#     @_fruit=params["fruit"]    
#     @_car=params["car"]
#     @_color=params["color"]
#     @_job=params["job"]
#     @_food=params["food"]
#     @_thing=params["thing"]
#     @_animal=params["animal"]
#     @_flower=params["flower"]

#     GameRound.new_game_round(@_firstname, @_lastname,@_city,@_country,@_fruit,@_car,@_color,@_job,@_food,@_thing,@_animal,@_flower,@user_game.round_number,@user_game.id)

#     @user_game.round_number = @user_game.round_number + 1
#     @user_game.save
#     if (@user_game.round_number == @user_game.game.rounds_num)
#       redirect_to :back
#     else
#       redirect_to games_path
#     end
#   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_game
      @user_game = UserGame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_game_params
      params.require(:user_game).permit(:user_id, :game_id, :score, :round_number)
    end
end
