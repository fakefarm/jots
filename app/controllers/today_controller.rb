class TodayController < ApplicationController
  def index
    @presenter = TodayPresenter.new(current_user)
  end
end
