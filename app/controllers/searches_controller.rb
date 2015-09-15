class SearchesController < ApplicationController
  def index
    search = params[:search][:search] # _dw how to clean up?
    @jots = Jot.search(search)
  end

  def show
    search = params[:id].gsub('-', ' ')
    @jots = Jot.where(user_id: current_user.id).where("title_without_tag LIKE \"%#{search}%\"")
    render :index
  end
end
