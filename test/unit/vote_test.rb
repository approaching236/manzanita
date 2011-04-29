require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  def test_resource_only_has_one_vote_per_user
    Vote.create(:up => false, :resource_id => 1, :user_id => 1)
    vote = Vote.new(:up => false, :resource_id => 1, :user_id => 1)
    assert !vote.valid?
  end
end
