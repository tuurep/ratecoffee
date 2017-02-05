require 'test_helper'

class CoffeeClubsControllerTest < ActionController::TestCase
  setup do
    @coffee_club = coffee_clubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coffee_clubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coffee_club" do
    assert_difference('CoffeeClub.count') do
      post :create, coffee_club: { city: @coffee_club.city, founded: @coffee_club.founded, name: @coffee_club.name, string: @coffee_club.string }
    end

    assert_redirected_to coffee_club_path(assigns(:coffee_club))
  end

  test "should show coffee_club" do
    get :show, id: @coffee_club
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coffee_club
    assert_response :success
  end

  test "should update coffee_club" do
    patch :update, id: @coffee_club, coffee_club: { city: @coffee_club.city, founded: @coffee_club.founded, name: @coffee_club.name, string: @coffee_club.string }
    assert_redirected_to coffee_club_path(assigns(:coffee_club))
  end

  test "should destroy coffee_club" do
    assert_difference('CoffeeClub.count', -1) do
      delete :destroy, id: @coffee_club
    end

    assert_redirected_to coffee_clubs_path
  end
end
