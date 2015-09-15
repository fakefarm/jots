class ArchivesController < ApplicationController
  def index
    @presenter = ArchivePresenter.new(current_user).jots
  end

  def show
    @presenter = ArchivePresenter.new(current_user, date = params[:id]).jots_for_day
  end
end
