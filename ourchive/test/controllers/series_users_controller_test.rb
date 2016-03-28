require 'test_helper'

class SeriesUsersControllerTest < ActionController::TestCase
  setup do
    @series_user = series_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:series_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create series_user" do
    assert_difference('SeriesUser.count') do
      post :create, series_user: { series_id: @series_user.series_id, user_id: @series_user.user_id }
    end

    assert_redirected_to series_user_path(assigns(:series_user))
  end

  test "should show series_user" do
    get :show, id: @series_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @series_user
    assert_response :success
  end

  test "should update series_user" do
    patch :update, id: @series_user, series_user: { series_id: @series_user.series_id, user_id: @series_user.user_id }
    assert_redirected_to series_user_path(assigns(:series_user))
  end

  test "should destroy series_user" do
    assert_difference('SeriesUser.count', -1) do
      delete :destroy, id: @series_user
    end

    assert_redirected_to series_users_path
  end
end
