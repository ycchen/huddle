class HomeController < ApplicationController
  
  def index
  	@status_reports = StatusReport.all
  end
end
