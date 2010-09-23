class MessagesController < ApplicationController
  def index
    @message = Message.new(:user_id => logged_in_user.id)
    @messages = logged_in_user.messages
    @feed = logged_in_user.feed
  end
  
  def create
    Message.create! params[:message]
    redirect_to :action => :index
  end
end