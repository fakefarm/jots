class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :create_entry

  def create_entry
    @entry = Entry.new
  end
end
