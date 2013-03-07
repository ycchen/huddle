class HomeController < ApplicationController
  
  def index
  	@status_reports = StatusReport.all
  	if current_user
  		redirect_to dashboard_path
  	end
  end

  def recentposts
  	@status_reports = StatusReport.order("created_at DESC")
  	render :layout => false
  end
end
