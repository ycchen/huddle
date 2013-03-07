class Api::ApiController < ActionController::Base
	
	private

	def validation_error(obj)
		error(406, obj.errors.full_messages)
	end

	def error(code, msg="")
		render :status => code, :json => msg
	end
end