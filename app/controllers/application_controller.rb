class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end
  helper_method :current_user

  def logged_in
    flash[:error] = "Please login before continuing!" unless current_user
    redirect_to '/login' unless current_user
  end

  def correct_user
    if current_user
      if (params[:id] != session[:user_id].to_s)
        redirect_to "/user/#{session[:user_id]}/" unless (:id == session[:user_id])
      end
    end

  end


end
