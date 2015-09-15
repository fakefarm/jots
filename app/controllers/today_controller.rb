class TodayController < ApplicationController
  def index
    @presenter = Jot.today_for_user(current_user.id)
  end
end
