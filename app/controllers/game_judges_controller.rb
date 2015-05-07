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
  end

  # GET /game_judges/1/edit
  def edit
  end

  # POST /game_judges
  # POST /game_judges.json
  def create
    @game_judge = GameJudge.new(game_judge_params)

    respond_to do |format|
      if @game_judge.save
        format.html { redirect_to @game_judge, notice: 'Game judge was successfully created.' }
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
