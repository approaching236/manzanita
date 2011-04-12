class Subject < ActiveRecord::Base
  has_many :prerequisites
  has_many :prereqs, :through => :prerequisites
  has_many :taggings
  has_many :tags, :through => :taggings
  has_many :resources

  validates_presence_of :name

  def blurb
    description || 'There is currently no description for this subject'
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['lower(name) Like ?', "%#{search.downcase}%"])
    else
      all.sort { |a, b| a.name <=> b.name }
    end
  end

  def tag_list= (list)
    taggings.delete_all
    list.split(',').each do |t|
      tag = Tag.find_or_create_by_name(t.strip)
      tags << tag unless tags.include?(tag)
    end
  end

  def tag_list
    tags.map { |t| t.name }.join(", ")
  end
end
