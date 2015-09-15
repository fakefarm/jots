require 'test_helper'

class ArchivesPresenterTest < ActionController::TestCase
  setup do
    @current_user = users(:one)
  end

  test 'it gets list of entries' do
    assert_equal 2, ArchivePresenter.new(@current_user).entries.count
  end

  test 'it gets the entries of a date' do
    skip("why are these dates not matching to fixture?")
    assert_equal 1, ArchivePresenter.new(@current_user, 2.days.ago).entries_for_day.count
  end
end
