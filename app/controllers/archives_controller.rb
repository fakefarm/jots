class ArchivesController < ApplicationController
  def index
    @presenter = ArchivePresenter.new(current_user).entries
  end

  def show
    @presenter = ArchivePresenter.new(current_user, date = params[:id]).entries_for_day
  end
end
