require 'test_helper'

class FavoriteNumbersControllerTest < ActionController::TestCase
  setup do
    @favorite_number = favorite_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_number" do
    assert_difference('FavoriteNumber.count') do
      post :create, favorite_number: { num1: @favorite_number.num1, num2: @favorite_number.num2, num3: @favorite_number.num3, num4: @favorite_number.num4, num5: @favorite_number.num5, num6: @favorite_number.num6, num7: @favorite_number.num7, user_id: @favorite_number.user_id }
    end

    assert_redirected_to favorite_number_path(assigns(:favorite_number))
  end

  test "should show favorite_number" do
    get :show, id: @favorite_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_number
    assert_response :success
  end

  test "should update favorite_number" do
    patch :update, id: @favorite_number, favorite_number: { num1: @favorite_number.num1, num2: @favorite_number.num2, num3: @favorite_number.num3, num4: @favorite_number.num4, num5: @favorite_number.num5, num6: @favorite_number.num6, num7: @favorite_number.num7, user_id: @favorite_number.user_id }
    assert_redirected_to favorite_number_path(assigns(:favorite_number))
  end

  test "should destroy favorite_number" do
    assert_difference('FavoriteNumber.count', -1) do
      delete :destroy, id: @favorite_number
    end

    assert_redirected_to favorite_numbers_path
  end
end
