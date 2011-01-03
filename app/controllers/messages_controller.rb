class MessagesController < ApplicationController
  def index
    @message = Message.new(:user_id => user.id)
    
    @user = user
    @messages = user.messages
    @feed = user.feed
    
    respond_to do |format|
      format.xml  { render :xml => @messages.to_xml  }
      format.json { render :xml => @messages.to_json }
      format.html
    end
  end
  
  def create
    Message.create! params[:message]
    redirect_to :action => :index, :status => 303
  end

private

  def user
    if params[:user_id]
      User.find_by_username(params[:user_id])
    else
      logged_in_user
    end
  end

end