class MessagesController < ApplicationController
  def index
    @logged_in_user = logged_in_user
    @message = Message.new
  end
  
  def create
    user_id = logged_in_user.id
    content = params[:message][:content]
    
    Message.create! :user_id => user_id, :content => content
    
    redirect_to :action => :index
  end
  
  # private
  
  def logged_in_user
    user_id = session[:logged_in_user_id]
    User.find_by_id user_id
  end
  
end