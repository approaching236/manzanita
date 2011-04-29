require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  def test_subject_factory_is_valid
    foo = create_subject
    assert foo.valid?
  end

  def test_should_accept_comma_seperated_list_of_tags
    foo = create_subject
    foo.tag_list = "i, am, awesome"
    foo.reload
    assert_equal 3, foo.tags.size
  end

  def test_subject_should_not_contain_duplicate_tags
    foo = create_subject
    foo.tag_list = "i, am"
    foo.tag_list = "i, am, awesome"
    assert_equal 3, foo.tags.size
  end
  
  def test_removing_tag_from_list
    foo = create_subject
    foo.tag_list = "i, am, awesome"
    foo.tag_list = "i, am"

    assert_equal 2, foo.tags.size
  end
  
  def test_should_provide_tag_list
    foo = create_subject
    assert_equal '', foo.tag_list
    
    foo.tags << Tag.new(:name => 'tag1')
    foo.tags << Tag.new(:name => 'tag2')
    
    assert_equal("tag1, tag2", foo.tag_list)
  end
end
