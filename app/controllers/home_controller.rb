class HomeController < ApplicationController
  
  def index
  	@status_reports = StatusReport.all
  	if current_user
  		redirect_to dashboard_path
  	end
  end

  def recentposts
    if params[:timestamp]
      @status_reports = StatusReport.order("created_at DESC").where("created_at > ?", params[:timestamp])
    else
      @status_reports = StatusReport.order("created_at DESC")
    end
  	render :layout => false
  end
end
