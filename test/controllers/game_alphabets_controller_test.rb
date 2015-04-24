require 'test_helper'

class GameAlphabetsControllerTest < ActionController::TestCase
  setup do
    @game_alphabet = game_alphabets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_alphabets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_alphabet" do
    assert_difference('GameAlphabet.count') do
      post :create, game_alphabet: { alphabet: @game_alphabet.alphabet, game_id: @game_alphabet.game_id, round_number: @game_alphabet.round_number }
    end

    assert_redirected_to game_alphabet_path(assigns(:game_alphabet))
  end

  test "should show game_alphabet" do
    get :show, id: @game_alphabet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_alphabet
    assert_response :success
  end

  test "should update game_alphabet" do
    patch :update, id: @game_alphabet, game_alphabet: { alphabet: @game_alphabet.alphabet, game_id: @game_alphabet.game_id, round_number: @game_alphabet.round_number }
    assert_redirected_to game_alphabet_path(assigns(:game_alphabet))
  end

  test "should destroy game_alphabet" do
    assert_difference('GameAlphabet.count', -1) do
      delete :destroy, id: @game_alphabet
    end

    assert_redirected_to game_alphabets_path
  end
end
