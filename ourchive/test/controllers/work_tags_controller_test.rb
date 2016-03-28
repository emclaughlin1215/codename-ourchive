require 'test_helper'

class WorkTagsControllerTest < ActionController::TestCase
  setup do
    @work_tag = work_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_tag" do
    assert_difference('WorkTag.count') do
      post :create, work_tag: { tag_id: @work_tag.tag_id, work_id: @work_tag.work_id }
    end

    assert_redirected_to work_tag_path(assigns(:work_tag))
  end

  test "should show work_tag" do
    get :show, id: @work_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_tag
    assert_response :success
  end

  test "should update work_tag" do
    patch :update, id: @work_tag, work_tag: { tag_id: @work_tag.tag_id, work_id: @work_tag.work_id }
    assert_redirected_to work_tag_path(assigns(:work_tag))
  end

  test "should destroy work_tag" do
    assert_difference('WorkTag.count', -1) do
      delete :destroy, id: @work_tag
    end

    assert_redirected_to work_tags_path
  end
end
