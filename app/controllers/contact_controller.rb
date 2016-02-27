class ContactController < ApplicationController
  def show
  	@last_updated = File.mtime("app/views/contact/show.html.erb")
  end
end
