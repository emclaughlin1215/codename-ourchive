require 'test_helper'

class BookmarkBookmarkTagsControllerTest < ActionController::TestCase
  setup do
    @bookmark_bookmark_tag = bookmark_bookmark_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookmark_bookmark_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookmark_bookmark_tag" do
    assert_difference('BookmarkBookmarkTag.count') do
      post :create, bookmark_bookmark_tag: { bookmark_id: @bookmark_bookmark_tag.bookmark_id, user_id: @bookmark_bookmark_tag.user_id }
    end

    assert_redirected_to bookmark_bookmark_tag_path(assigns(:bookmark_bookmark_tag))
  end

  test "should show bookmark_bookmark_tag" do
    get :show, id: @bookmark_bookmark_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bookmark_bookmark_tag
    assert_response :success
  end

  test "should update bookmark_bookmark_tag" do
    patch :update, id: @bookmark_bookmark_tag, bookmark_bookmark_tag: { bookmark_id: @bookmark_bookmark_tag.bookmark_id, user_id: @bookmark_bookmark_tag.user_id }
    assert_redirected_to bookmark_bookmark_tag_path(assigns(:bookmark_bookmark_tag))
  end

  test "should destroy bookmark_bookmark_tag" do
    assert_difference('BookmarkBookmarkTag.count', -1) do
      delete :destroy, id: @bookmark_bookmark_tag
    end

    assert_redirected_to bookmark_bookmark_tags_path
  end
end
