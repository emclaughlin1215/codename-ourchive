require 'test_helper'

class ModerationTypesControllerTest < ActionController::TestCase
  setup do
    @moderation_type = moderation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moderation_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moderation_type" do
    assert_difference('ModerationType.count') do
      post :create, moderation_type: { moderation_description: @moderation_type.moderation_description, moderation_type: @moderation_type.moderation_type }
    end

    assert_redirected_to moderation_type_path(assigns(:moderation_type))
  end

  test "should show moderation_type" do
    get :show, id: @moderation_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moderation_type
    assert_response :success
  end

  test "should update moderation_type" do
    patch :update, id: @moderation_type, moderation_type: { moderation_description: @moderation_type.moderation_description, moderation_type: @moderation_type.moderation_type }
    assert_redirected_to moderation_type_path(assigns(:moderation_type))
  end

  test "should destroy moderation_type" do
    assert_difference('ModerationType.count', -1) do
      delete :destroy, id: @moderation_type
    end

    assert_redirected_to moderation_types_path
  end
end
