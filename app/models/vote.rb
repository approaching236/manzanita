class Vote < ActiveRecord::Base
  belongs_to :resource
  belongs_to :user
  
  validates_uniqueness_of :user_id, :scope => :resource_id
end
