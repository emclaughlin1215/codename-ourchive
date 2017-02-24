require 'test_helper'

class UserCollectionsControllerTest < ActionController::TestCase
  setup do
    @user_collection = user_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_collection" do
    assert_difference('UserCollection.count') do
      post :create, user_collection: { collection_id: @user_collection.collection_id, user_id: @user_collection.user_id }
    end

    assert_redirected_to user_collection_path(assigns(:user_collection))
  end

  test "should show user_collection" do
    get :show, id: @user_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_collection
    assert_response :success
  end

  test "should update user_collection" do
    patch :update, id: @user_collection, user_collection: { collection_id: @user_collection.collection_id, user_id: @user_collection.user_id }
    assert_redirected_to user_collection_path(assigns(:user_collection))
  end

  test "should destroy user_collection" do
    assert_difference('UserCollection.count', -1) do
      delete :destroy, id: @user_collection
    end

    assert_redirected_to user_collections_path
  end
end
