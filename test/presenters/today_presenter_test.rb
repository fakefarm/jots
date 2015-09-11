require 'test_helper'

class TodayPresenterTest < ActionController::TestCase
  setup do
    @current_user = users(:one)
    entries = [entries(:today_one), entries(:today_two)]
    entries.map { |e| e.created_at = Time.now }
  end

  test 'it gets jots for today' do
    assert_equal 2, TodayPresenter.new(@current_user).entries.count
  end
end
