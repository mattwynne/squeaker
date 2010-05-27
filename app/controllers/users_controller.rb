class UsersController < ApplicationController
  def follow
    # user_to_follow = Users.find_by_id params[:user_id]
    redirect_to :controller => :messages, :action => :index
  end
end