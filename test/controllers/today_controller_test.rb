require 'test_helper'

class TodayControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:one)
  end

  test 'get #index' do
    get :index
    assert_not_nil assigns(:presenter)
    assert_response :success
  end
end
