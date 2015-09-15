require 'test_helper'

class AssignTagTest < ActiveSupport::TestCase
  test 'it handles tags' do
    tag = AssignTag.new('#entry', 1)
    # _dw what better way to get id tested
    # thinking of moving this to a before_save in Jot
    assert_equal 980190963, tag.id
  end
end
