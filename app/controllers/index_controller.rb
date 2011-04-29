class IndexController < ApplicationController

  def index
    @submissions = Resource.all(:limit => 5, :order => 'created_at desc')
    @recent = Subject.all(:limit => 5, :order => 'created_at desc')
    @random = Subject.all(:limit => 5, :order => 'random()')
  end

end
