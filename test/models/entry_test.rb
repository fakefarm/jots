require 'test_helper'

class JotTest < ActiveSupport::TestCase
  setup do
    @current_user = users(:one)
  end

  test 'find the tags' do
    @entry = Jot.new(entry: 'this is a #tagged')
    assert_equal '#tagged', @entry.tag
  end

  test 'find the title' do
    @entry = Jot.new(entry: 'this is a #tagged')
    assert_equal 'this is a', @entry.title
  end

  test 'lists archives_for_user' do
    archives = Jot.archives_before_today(@current_user)
    assert_equal 2, archives.count
  end
end
