class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :subjects, :through => :taggings
  validates_uniqueness_of :name

  validates_presence_of :name
end
