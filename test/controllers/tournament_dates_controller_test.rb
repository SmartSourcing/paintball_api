require 'test_helper'

class TournamentDatesControllerTest < ActionController::TestCase
  setup do
    @tournament_date = tournament_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_date" do
    assert_difference('TournamentDate.count') do
      post :create, tournament_date: {  }
    end

    assert_redirected_to tournament_date_path(assigns(:tournament_date))
  end

  test "should show tournament_date" do
    get :show, id: @tournament_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_date
    assert_response :success
  end

  test "should update tournament_date" do
    patch :update, id: @tournament_date, tournament_date: {  }
    assert_redirected_to tournament_date_path(assigns(:tournament_date))
  end

  test "should destroy tournament_date" do
    assert_difference('TournamentDate.count', -1) do
      delete :destroy, id: @tournament_date
    end

    assert_redirected_to tournament_dates_path
  end
end
