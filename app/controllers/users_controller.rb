class UsersController < ApplicationController
#  before_filter :require_no_user, :only => [:new, :create]
#  before_filter :require_user, :only => [:show, :edit, :update]
  
  before_filter :find_user
  
  def new
    @user = User.new
  end

  def index
    @users = User.all.sort { |a,b| b.created_at <=> a.created_at }
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "user registered!"
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @resources = @user.resources.sort { |a, b| b.created_at <=> a.created_at }
  end
 
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "user updated!"
      redirect_to user_url(@user)
    else
      render :action => :edit
    end
  end

  private
    def find_user
      @user = current_user
    end
end
