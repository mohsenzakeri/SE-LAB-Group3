# encoding: UTF-8
class GameAlphabetsController < ApplicationController
  before_action :set_game_alphabet, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /game_alphabets
  # GET /game_alphabets.json
  def index
    @game_alphabets = GameAlphabet.all
  end

  # GET /game_alphabets/1
  # GET /game_alphabets/1.json
  def show
  end

  # GET /game_alphabets/new
  def new
    @game_alphabet = GameAlphabet.new
  end

  # GET /game_alphabets/1/edit
  def edit
  end

  # POST /game_alphabets
  # POST /game_alphabets.json
  def create
    @game_alphabet = GameAlphabet.new(game_alphabet_params)

    respond_to do |format|
      if @game_alphabet.save
        format.html { redirect_to @game_alphabet, notice: 'Game alphabet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game_alphabet }
      else
        format.html { render action: 'new' }
        format.json { render json: @game_alphabet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_alphabets/1
  # PATCH/PUT /game_alphabets/1.json
  def update
    respond_to do |format|
      if @game_alphabet.update(game_alphabet_params)
        format.html { redirect_to @game_alphabet, notice: 'Game alphabet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game_alphabet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_alphabets/1
  # DELETE /game_alphabets/1.json
  def destroy
    @game_alphabet.destroy
    respond_to do |format|
      format.html { redirect_to game_alphabets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_alphabet
      @game_alphabet = GameAlphabet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_alphabet_params
      params.require(:game_alphabet).permit(:game_id, :round_number, :alphabet)
    end
end
