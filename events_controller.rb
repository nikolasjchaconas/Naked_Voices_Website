class EventsController < ApplicationController
  def show
  	@last_updated = File.mtime("app/views/events/show.html.erb")
  end
  def download
  	send_file 'app/assets/Campus_IV_map'
  	:type=>"application/pdf", 
    :x_sendfile=>true
  end
end
