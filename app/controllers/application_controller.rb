class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource
  before_action :create_jot
  before_action :side_bar

  def create_jot
    @jot = Jot.new
  end

  def side_bar
    if current_user
      @jot_count = current_user.jots.count

      # Basic Rails Best Practices.

      # @jot_count = Jot.count(current_user)
      @days = Jot.days(current_user)
      @tags = current_user.tags.count
      @tag_list = Tag.list_for_user(current_user)
      @archives = Jot.archives_before_today(current_user)
    end
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
