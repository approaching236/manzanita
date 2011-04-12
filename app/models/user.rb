class User < ActiveRecord::Base
  acts_as_authentic
  has_many :votes
  has_many :resources
  
  def is_admin?
    access_level.to_i >= 1000
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
