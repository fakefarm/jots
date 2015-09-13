require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test 'find the tags' do
    @entry = Entry.new(entry: 'this is a #tagged')
    assert_equal '#tagged', @entry.tag
  end

  test 'find the title' do
    @entry = Entry.new(entry: 'this is a #tagged')
    assert_equal 'this is a', @entry.title
  end
end
