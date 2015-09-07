class ArchivesController < ApplicationController
  def index
    @archives = Entry.where(user_id: current_user.id).
                      inject([]) { |memo, entry| memo.push entry.created_at.to_date; memo }.uniq
  end

  def show
    @entry = Entry.new
    @date = params[:id]
    @entries = Entry.where(user_id: current_user.id).where("DATE(created_at) = ?", @date).reverse

    @archives = Entry.where(user_id: current_user.id).
                      inject([]) { |memo, entry| memo.push entry.created_at.to_date; memo }.uniq
  end
end
