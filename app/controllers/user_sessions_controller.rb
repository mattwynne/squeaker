class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    username = params[:user_session][:username]
    user = User.find_by_username(username)
    unless user
      raise("No user with username '#{username}'")
    end
    session[:logged_in_user_id] = user.id

    redirect_to root_path, :status => 303
  end

  def destroy
    session[:logged_in_user_id] = nil
    redirect_to root_path
  end
end
