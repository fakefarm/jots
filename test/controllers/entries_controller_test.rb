require 'test_helper'
class JotsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:one)
    @entry = entries(:today_one)
  end

  test "should get index" do
    skip("I'm using the controller but not the views - how should I test this?")
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should create entry" do
    skip("I'm using the controller but not the views - how should I test this?")
    assert_difference('Jot.count') do
      post :create, entry: { body: @entry.body, entry: @entry.entry, user_id: @entry.user_id, title_without_tag: @entry.title_without_tag }
    end
    assert_redirected_to entries_path
  end

  test "should destroy entry" do
    skip("I'm using the controller but not the views - how should I test this?")
    assert_difference('Jot.count', -1) do
      delete :destroy, id: @entry
    end

    assert_redirected_to entries_path
  end
end
