class ApplicationController < ActionController::Base
  protect_from_forgery

  	rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
  	
	helper_method :admin?

	def routing_error
		render_not_found
	end

	

	protected

	def admin?
		unless current_user && current_user.admin?
			false
		else
			true
		end

	end

	def authorize
		unless admin?
			flash[:error] = "Unauthorized access"
		  	redirect_to projects_path
	  		false
		end
	end

	# def admin?
	# 	unless (current_user && current_user.admin?)
	# 	  	flash[:error] = "Unauthorized access"
	#   	redirect_to projects_path
	#   	false
	# 	end
	# end
	
	def render_not_found
		flash[:notice] = 'The object you tried to access does not exist!'
		redirect_to root_path
	end
end
