# encoding: UTF-8
class GameJudgesController < ApplicationController
  before_action :set_game_judge, only: [:show, :edit, :update, :destroy]

  # GET /game_judges
  # GET /game_judges.json
  def index
    @game_judges = GameJudge.all
  end

  # GET /game_judges/1
  # GET /game_judges/1.json
  def show
  end

  # GET /game_judges/new
  def new
    @game_judge = GameJudge.new
    @user_game = UserGame.find_by_id(params[:judge_id])
    @game_round = @user_game.game_rounds.last
  end

  # GET /game_judges/1/edit
  def edit
  end

  # POST /game_judges
  # POST /game_judges.json
  def create
    @game_judge = GameJudge.new(game_judge_params)
    @game_round = @game_judge.game_round
    @user_game = @game_round.user_game
    


    
    respond_to do |format|
      if @game_judge.save
        if @game_judge.firstname
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.lastname
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.city
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.country
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.fruit
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.car
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.color
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.job
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.food
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.thing
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.animal
          @game_round.score = @game_round.score + 10
        end
        if @game_judge.flower
          @game_round.score = @game_round.score + 10
        end
        @game_round.save

        
        @game = @user_game.game   
        @game.currently_scored = @game.currently_scored + 1
        @game.save
        
        PrivatePub.publish_to("/user_games/scoring_finished/#{@game_round.user_game.game.id}" , "validate();")
        #@user_game.score = @user_game.score + @game_round.score
        #@user_game.save

        format.html { redirect_to @user_game.game_rounds.last, notice: 'این‌ دور از بازی به اتمام رسید.' }
        format.json { render action: 'show', status: :created, location: @game_judge }
      else
        format.html { render action: 'new' }
        format.json { render json: @game_judge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_judges/1
  # PATCH/PUT /game_judges/1.json
  def update
    respond_to do |format|
      if @game_judge.update(game_judge_params)
        format.html { redirect_to @game_judge, notice: 'Game judge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game_judge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_judges/1
  # DELETE /game_judges/1.json
  def destroy
    @game_judge.destroy
    respond_to do |format|
      format.html { redirect_to game_judges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_judge
      @game_judge = GameJudge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_judge_params
      params.require(:game_judge).permit(:game_round_id, :firstname, :lastname, :city, :country, :fruit, :car, :color, :job, :food, :thing, :animal, :flower)
    end
end
