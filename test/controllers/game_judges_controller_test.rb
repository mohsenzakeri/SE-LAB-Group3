require 'test_helper'

class GameJudgesControllerTest < ActionController::TestCase
  setup do
    @game_judge = game_judges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_judges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_judge" do
    assert_difference('GameJudge.count') do
      post :create, game_judge: { animal: @game_judge.animal, car: @game_judge.car, city: @game_judge.city, color: @game_judge.color, country: @game_judge.country, firstname: @game_judge.firstname, flower: @game_judge.flower, food: @game_judge.food, fruit: @game_judge.fruit, game_round_id: @game_judge.game_round_id, job: @game_judge.job, lastname: @game_judge.lastname, thing: @game_judge.thing }
    end

    assert_redirected_to game_judge_path(assigns(:game_judge))
  end

  test "should show game_judge" do
    get :show, id: @game_judge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_judge
    assert_response :success
  end

  test "should update game_judge" do
    patch :update, id: @game_judge, game_judge: { animal: @game_judge.animal, car: @game_judge.car, city: @game_judge.city, color: @game_judge.color, country: @game_judge.country, firstname: @game_judge.firstname, flower: @game_judge.flower, food: @game_judge.food, fruit: @game_judge.fruit, game_round_id: @game_judge.game_round_id, job: @game_judge.job, lastname: @game_judge.lastname, thing: @game_judge.thing }
    assert_redirected_to game_judge_path(assigns(:game_judge))
  end

  test "should destroy game_judge" do
    assert_difference('GameJudge.count', -1) do
      delete :destroy, id: @game_judge
    end

    assert_redirected_to game_judges_path
  end
end
