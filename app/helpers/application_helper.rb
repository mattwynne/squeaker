# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_list(users, list_id)
    render :partial => '/users/users', :locals => {
      :list_id => list_id, 
      :users => users
    }
  end	
end
