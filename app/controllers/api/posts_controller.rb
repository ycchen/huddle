class Api::PostsController < Api::ApiController

	def create
		status_report = StatusReport.new(params[:status_report])
	    status_report.user_id = current_user.id
	    status_report.status_date = Time.zone.now.to_datetime

	    if status_report.save
	    	render :status => 200, :json => true
	    else
	    	validation_error(status_report)
	    end
		
	end
	
end