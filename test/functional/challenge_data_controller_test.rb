require 'test_helper'

class ChallengeDataControllerTest < ActionController::TestCase
  setup do
    @challenge_datum = challenge_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challenge_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create challenge_datum" do
    assert_difference('ChallengeDatum.count') do
      post :create, challenge_datum: { difficulty: @challenge_datum.difficulty, name: @challenge_datum.name }
    end

    assert_redirected_to challenge_datum_path(assigns(:challenge_datum))
  end

  test "should show challenge_datum" do
    get :show, id: @challenge_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @challenge_datum
    assert_response :success
  end

  test "should update challenge_datum" do
    put :update, id: @challenge_datum, challenge_datum: { difficulty: @challenge_datum.difficulty, name: @challenge_datum.name }
    assert_redirected_to challenge_datum_path(assigns(:challenge_datum))
  end

  test "should destroy challenge_datum" do
    assert_difference('ChallengeDatum.count', -1) do
      delete :destroy, id: @challenge_datum
    end

    assert_redirected_to challenge_data_path
  end
end
