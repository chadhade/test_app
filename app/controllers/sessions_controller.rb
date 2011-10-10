class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_handle_and_pass(params[:session][:handle], params[:session][:pass])
	sign_in user
	redirect_to convos_path
  end
  
  def destroy
    sign_out
	redirect_to new_session_path
  end

end
