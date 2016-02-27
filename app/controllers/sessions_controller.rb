class SessionsController < ApplicationController
	skip_before_filter :verify_authenticity_token
  def new
  	  	@last_updated = File.mtime("app/views/events/show.html.erb")
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in"
      redirect_to "/user/#{user.id}"
    else
      flash[:error] = "Incorrect login/password. Please try again."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to '/'
  end

end
