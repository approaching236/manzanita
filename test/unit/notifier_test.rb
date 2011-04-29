require 'test_helper'

class NotifierTest < ActionMailer::TestCase

  def setup
    initialize_test_deliveries
  end

  # def test_password_reset_instructions
    # user = User.new(:email => 'foo@example.com')
    # Notifier.deliver_password_reset_instructions(user)
    # mail = ActionMailer::Base.deliveries.first
    # puts mail.body.inspect

    # assert_match(/bouncy.heroku.com/, mail.body)
  # end

end

