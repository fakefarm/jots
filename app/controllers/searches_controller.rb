class SearchesController < ApplicationController
  def index
    search = params[:search][:search]
    @entries = Entry.where(user_id: current_user.id).where("title LIKE \"%#{search}%\"")
  end

  def show
    search = params[:id].gsub('-', ' ')
    @entries = Entry.where(user_id: current_user.id).where("title LIKE \"%#{search}%\"")
    render :index
  end
end
