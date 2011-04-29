require 'test_helper'

class TagsControllerTest < ActionController::TestCase

  # This is the easiest thing to do right meow.
  def setup
    @tag = Tag.create(:name => 'foo')
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  test "should show tag" do
    get :show, :id => @tag.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tag.id
    assert_response :success
  end

  test "should update tag" do
    put :update, :id => @tag.id, :tag => { :name => 'bar' }
    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, :id => @tag.id
    end

    assert_redirected_to tags_path
  end
end
