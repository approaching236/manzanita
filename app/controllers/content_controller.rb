class ContentController < ApplicationController

  def show
    render params[:path]
  end

end
