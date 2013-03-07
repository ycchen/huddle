class DashboardsController < ApplicationController
	before_filter :authenticate_user!			
  def show
  	@status_report = current_user.status_reports.new
  	@projects = current_user.projects.order('name ASC')
  end
end
