class SearchController < ApplicationController
  def init
    
  end
  
  def search_users
    @users = User.find_all_by_username params[:query]
  end
end