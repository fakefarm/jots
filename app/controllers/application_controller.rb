class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource
  before_action :create_entry
  before_action :stats
  before_action :side_bar_nav

  def create_entry
    @entry = Jot.new
  end

  def side_bar_nav
    if current_user
      @app_presenter = ApplicationPresenter.new(current_user)
      @tag_list = Tag.where(user_id: current_user.id)
    end
  end

  def stats
    if current_user
      @entry_count = Jot.where(user_id: current_user.id).count
      @days = Jot.where(user_id: current_user.id).
                        inject([]) { |memo, entry| memo.push entry.created_at.to_date; memo }.uniq.count
      @tags = Tag.where(user_id: current_user.id).count
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
