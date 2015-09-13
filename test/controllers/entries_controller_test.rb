require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:one)
    @entry = entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post :create, entry: { body: @entry.body, entry: @entry.entry, user_id: @entry.user_id, title_without_tag: @entry.title_without_tag }
    end
    assert_redirected_to entries_path
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, id: @entry
    end

    assert_redirected_to entries_path
  end
end
