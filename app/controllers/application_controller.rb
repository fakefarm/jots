class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :create_entry
  before_action :list_archives
  layout :layout_by_resource

  def create_entry
    @entry = Entry.new
  end

  def list_archives
    @archives = Entry.where(user_id: current_user.id).
                  inject([]) { |memo, entry| memo.push entry.created_at.to_date; memo }.uniq
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
