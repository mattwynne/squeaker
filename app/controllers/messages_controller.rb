class MessagesController < ApplicationController
  def index
    @logged_in_user = logged_in_user
    @message = Message.new
  end
  
  private
  
  def logged_in_user
    user_id = session[:logged_in_user_id]
    User.find_by_id(user_id)
  end
end