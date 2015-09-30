class ArchivesController < ApplicationController
  def index
    @archives = jots_for_day
  end

  def show
    @presenter = ArchivePresenter.new(current_user, date = params[:id]).jots_for_day
  end

private

  def jots
    Jot.archives_before_today(current_user.id)
  end

  def jots_for_day
    @jots = current_user.jots.where("DATE(created_at) <> ?", Date.today).reverse
  end
end
