# encoding: UTF-8
class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

#Niloofar Added
  before_filter :login_required, only: [:show , :edit, :index, :update, :destroy, :create, :new]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all 
    @users = User.all   
    @current_user_joined = false 
    
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @creator = User.find_by(id: @game.creator_id)
    @joined_users_name = Array.new
    @game.user_games.each do |joined_users|
      @this = User.find_by(id: joined_users.user_id)
      @joined_users_name << @this.nickname
    end
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    if user_signed_in?
      @game.creator_id = current_user.id
    end
    @game.joined_players = 1
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'بازی جدید ایجاد شد.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
    UserGame.create_user_game(current_user,@game)
    	#@alphabets = ['s','y','z','a','b']
    	@alphabets = ['الف' , 'ب' , '‍‍‍پ' , 'ت' , 'ث' , 'ج' , 'چ' , 'ح' , 'خ' , 'د' , 'ذ' , 'ر' , 'ز' , 'ژ' , 'س' , 'ش' , 'ص' ,  'ض' ,  'ط' , 'ظ' ,  'ع' , 'غ'  , 'ف'  , 'ق' , 'ک' , 'گ' , 'ال' , 'م' , 'ن' , 'و' , 'ه' , 'ی']
#	
    for i in 1..@game.rounds_num
	@selected_letter = @alphabets.sample
	@alphabets.delete(@selected_letter)
	GameAlphabet.new_game_alphabet(@game.id,i,@selected_letter)
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'بازی با موفقیت تغییر یافت.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:players_num, :rounds_num)
    end
end
