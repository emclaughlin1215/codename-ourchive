require 'test_helper'

class SubscriptionPagesControllerTest < ActionController::TestCase
  setup do
    @subscription_page = subscription_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscription_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription_page" do
    assert_difference('SubscriptionPage.count') do
      post :create, subscription_page: { finished: @subscription_page.finished, user_id: @subscription_page.user_id, work_id: @subscription_page.work_id }
    end

    assert_redirected_to subscription_page_path(assigns(:subscription_page))
  end

  test "should show subscription_page" do
    get :show, id: @subscription_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription_page
    assert_response :success
  end

  test "should update subscription_page" do
    patch :update, id: @subscription_page, subscription_page: { finished: @subscription_page.finished, user_id: @subscription_page.user_id, work_id: @subscription_page.work_id }
    assert_redirected_to subscription_page_path(assigns(:subscription_page))
  end

  test "should destroy subscription_page" do
    assert_difference('SubscriptionPage.count', -1) do
      delete :destroy, id: @subscription_page
    end

    assert_redirected_to subscription_pages_path
  end
end
