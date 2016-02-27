class UserController < ApplicationController
  before_filter :logged_in, :only => [:show, :edit, :show_all]
  before_filter :correct_user, :only => [:show, :edit, :show_all]
  def show
  	@user = User.find_by(id: session[:user_id])
  	@last_updated = File.mtime("app/views/home/show.html.erb")
  end
  def new
    @user = User.find_by(id: session[:user_id])
  	  	@last_updated = File.mtime("app/views/home/show.html.erb")
  end
  def edit
  	  @last_updated = File.mtime("app/views/home/show.html.erb")
	  	@user = User.find_by(id: session[:user_id])
        @user.update(user_params)
        if @user.save
          session[:user_id] = @user.id
          flash[:success] = "Your information has been updated."
          redirect_to "/user/#{@user.id}"
        else
          flash[:error] = user.errors.full_messages.to_sentence
          redirect_to "/"
        end
  end

  def destroy
  	user_to_delete = User.find_by(id: params[:user_to_delete])
  	user_to_delete.destroy!
  	if(params[:user_id] == params[:user_to_delete])
  		redirect_to "/logout"
  	else
	  	redirect_to "/user/#{params[:id]}/show_all_user"
	end
  rescue
  	redirect_to "/"
  end

  def show_all
  	  	  	@last_updated = File.mtime("app/views/home/show.html.erb")
  	  	  	@user = User.find_by(id: params[:id])
  	  	 	@users = User.all
  		
  end
  def create
  	user = User.new(username: params[:username])
  	user.password = params[:password]
  	user.password_confirmation = params[:password_confirmation]
  	if user.save
  		flash[:success] = "New Account Successfully Created!"
  		redirect_to "/user/:id"
  	
  	else
  		flash[:error] = "Problem creating account"
  		redirect_to "/user/:id/add_user"
  	end
  end

  private

    def user_params
      params.permit(:username, :password, :password_confirmation)
    end

end
