class UserController < ApplicationController
  before_filter :logged_in, :only => [:show, :edit, :show_all, :leaderboard]
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
          flash[:error] = @user.errors.full_messages.to_sentence
          redirect_to "/user/#{@user.id}"
        end
  end

  def destroy
  	user_to_delete = User.find_by(id: params[:user_to_delete])
  	user_to_delete.destroy!
  	if(params[:id].to_s == params[:user_to_delete].to_s)
      flash[:success] = "You deleted Yourself. You've been logged Out"
  		render "/logout"
  	else
	  	redirect_to "/user/#{params[:id]}/show_all_user"
	end
  rescue
  	redirect_to "/"
  end

  def change_user_sold
    user = User.find_by(id: params[:user_to_change])
    if (params[:commit] == "Add Entries")
      user.update_attribute(:num_sold, user.num_sold + params[:num].to_i)
    else
      user.update_attribute(:num_sold, user.num_sold - params[:num].to_i)
    end
    redirect_to "/leaderboard"
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
    user.num_sold = 0
  	if user.save
  		flash[:success] = "New User Login Successfully Created!"
  		redirect_to "/user/:id"
  	
  	else
  		flash[:error] = user.errors.full_messages.to_sentence
  		redirect_to "/user/#{user.id}/add_user"
  	end
  end

  def leaderboard
    @users = []
    @total = 0
    index = 0
    all_users = User.all
    all_users.each do |user|
      @users.each do |user_it|
        if user.num_sold > user_it.num_sold
          index = @users.index(user_it)
          break
        end
        index = @users.index(user_it) + 1
      end
      puts "index is #{index}"
      if(user.username != "Guest")
        @users.insert(index, user)
      end
      @total += user.num_sold
      
    end
    @largest = @users[0].num_sold

  end

  private

    def user_params
      params.permit(:username, :password, :password_confirmation)
    end

end
