require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def test_unique_tag_name
    tag1 = Tag.create(:name => 'foo')
    tag2 = Tag.create(:name => 'foo')
    
    assert !tag2.valid?
  end
end
