# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_logged_in_user

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
private

  def set_logged_in_user
    @logged_in_user = logged_in_user
  end

  def logged_in_user
    user_id = session[:logged_in_user_id]
    User.find_by_id(user_id) || User.unknown
  end
end
