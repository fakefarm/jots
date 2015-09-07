class SearchesController < ApplicationController
  def index
    @entries = Entry.search params[:search][:search]
    @entry = Entry.new
  end
end
