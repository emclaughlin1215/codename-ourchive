require 'test_helper'

class WorkUsersControllerTest < ActionController::TestCase
  setup do
    @work_user = work_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_user" do
    assert_difference('WorkUser.count') do
      post :create, work_user: { user_id: @work_user.user_id, work_id: @work_user.work_id }
    end

    assert_redirected_to work_user_path(assigns(:work_user))
  end

  test "should show work_user" do
    get :show, id: @work_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_user
    assert_response :success
  end

  test "should update work_user" do
    patch :update, id: @work_user, work_user: { user_id: @work_user.user_id, work_id: @work_user.work_id }
    assert_redirected_to work_user_path(assigns(:work_user))
  end

  test "should destroy work_user" do
    assert_difference('WorkUser.count', -1) do
      delete :destroy, id: @work_user
    end

    assert_redirected_to work_users_path
  end
end
