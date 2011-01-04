class UsersController < ApplicationController
  def follow
    raise "You need to log in" if @logged_in_user.unknown?
    user_to_follow = User.find_by_id params[:user_id]
    
    @logged_in_user.followed_users << user_to_follow
    @logged_in_user.save
    redirect_to :controller => :messages, :action => :index
  end

  def show
    @user = User.find_by_username(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    new_user = User.create!(params[:user])
    session[:logged_in_user_id] = new_user.id
    redirect_to root_path, :status => 303
  end
end
