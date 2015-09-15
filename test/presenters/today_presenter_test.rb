require 'test_helper'

class TodayPresenterTest < ActionController::TestCase
  setup do
    @current_user = users(:one)
    jots = [jots(:today_one), jots(:today_two)]
    jots.map { |e| e.created_at = Time.now }
  end

  test 'it gets jots for today' do
    assert_equal 2, TodayPresenter.new(@current_user).jots.count
  end
end
