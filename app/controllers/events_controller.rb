class EventsController < ApplicationController
  def show
  	@last_updated = File.mtime("app/views/events/show.html.erb")
  end
end
