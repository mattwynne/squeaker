class UserSession
  attr_accessor :username
  
  def id
  end
  
  def new_record?
    true
  end
end

class UserSessionsController < ApplicationController
  def index
    @user_session = UserSession.new
  end
  
  def create
    username = params[:user_session][:username]
    user = User.find_by_username username
    raise "User '#{username}' not found" unless user
    session[:logged_in_user_id] = user.id
    redirect_to root_path
  end
  
end