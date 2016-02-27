class MembersController < ApplicationController
  def show
  	@last_updated = File.mtime("app/views/members/show.html.erb")
  end
  def new

  end
end
