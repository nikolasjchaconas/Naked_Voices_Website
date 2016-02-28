class EventsController < ApplicationController
  def show
  	@last_updated = File.mtime("app/views/events/show.html.erb")
  	Venmo.configure do |c|
	  c.access_token= "My Super Secret API"
	  c.privacy= "private"
	  #private, public, friends are vaild options
	  #see Venmo documentation
	end
  end
end
