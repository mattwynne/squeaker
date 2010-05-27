class SearchController < ApplicationController
  def search_users
    @users = User.find :all, :conditions => ["username like '%%#{params[:query]}%%'"]
  end
end