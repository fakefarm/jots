class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :create_entry
  layout :layout_by_resource

  def create_entry
    @entry = Entry.new
  end

  protected

  def layout_by_resource
    if devise_controller?
      "welcome"
    else
      "application"
    end
  end
end
