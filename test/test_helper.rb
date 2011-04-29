ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'
require 'authlogic/test_case'

begin
  require 'redgreen' unless ENV['TM_MODE']
rescue LoadError
  puts 'sudo gem install redgreen for fancy colors.'
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def create_subject(options = {})
    default_values = { :name => 'Test subject' }
    Subject.create(default_values.merge(options))
  end
end

class ActionController::TestCase
  setup :activate_authlogic

  attr_reader :current_user

  def user_login
    UserSession.create(users(:foo))
  end
end
