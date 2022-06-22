class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  include ActionController::Cookies

  before_action :authorize
 
private
def authorize 
  @currentuser= User.find_by(id: session[:user_id])
  render json: {errors: ["Not authorized"]},status: :unauthorized unless @currentuser

end



  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

 

  
end
