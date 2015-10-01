class ArchivesController < ApplicationController
  def index
    @archives = jots_by_day
  end

  def show
    @presenter = ArchivePresenter.new(current_user, date = params[:id]).jots_for_day
  end

private

  def jots
    Jot.archives_before_today(current_user.id)
  end

  def jots_by_day
    current_user.jots.where("created_at < ?", Date.today.beginning_of_day ). # gets all jots from user before today
      order("created_at DESC"). # newest first
      group_by {|j| j.created_at.to_date.strftime("%B %d, %Y") } # rails method #group_by creates a hash and can use 2 arguments (key and value)
  end
end

