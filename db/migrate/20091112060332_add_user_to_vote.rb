class AddUserToVote < ActiveRecord::Migration
  def self.up
    add_column :votes, :user_id, :integer
  end

  def self.down
    remove_column :votes, :user_id
  end
end
