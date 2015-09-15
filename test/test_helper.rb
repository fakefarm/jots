ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all
  # _dw needed for controller tests. Where do I put it?
end

class ActionController::TestCase
  include Devise::TestHelpers
end
