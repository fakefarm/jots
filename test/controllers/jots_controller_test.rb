require 'test_helper'
class JotsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:one)
    @jot = jots(:today_one)
  end

  test "should get index" do
    skip("I'm using the controller but not the views - how should I test this?")
    get :index
    assert_response :success
    assert_not_nil assigns(:jots)
  end

  test "should create jot" do
    skip("I'm using the controller but not the views - how should I test this?")
    assert_difference('Jot.count') do
      post :create, jot: { body: @jot.body, jot: @jot.title, user_id: @jot.user_id, title_without_tag: @jot.title_without_tag }
    end
    assert_redirected_to jots_path
  end

  test "should destroy jot" do
    skip("I'm using the controller but not the views - how should I test this?")
    assert_difference('Jot.count', -1) do
      delete :destroy, id: @jot
    end

    assert_redirected_to jots_path
  end
end
