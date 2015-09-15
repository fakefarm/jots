require 'test_helper'

class ArchivesPresenterTest < ActionController::TestCase
  setup do
    @current_user = users(:one)
  end

  test 'it gets list of jots' do
    assert_equal 2, ArchivePresenter.new(@current_user).jots.count
  end

  test 'it gets the jots of a date' do
    skip("why are these dates not matching to fixture?")
    assert_equal 1, ArchivePresenter.new(@current_user, 2.days.ago).jots_for_day.count
  end
end
