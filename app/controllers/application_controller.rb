class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin?

  protected

  def admin?
  	unless (current_user && current_user.admin?)
  	  	flash[:error] = "Unauthorized access"
	  	redirect_to projects_path
	  	false
  	end
  end
  
end
