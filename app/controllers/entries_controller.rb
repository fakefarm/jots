class JotsController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Jot.where(user_id: current_user.id).
                     where("DATE(created_at) = ?", Date.today).
                     reverse
  end

  def show; end

  def new
  end

  def edit
  end

  def create
=begin
  1. new entry
  2. get my tags
  3. find the tag
  4. add tag id to entry
  5. save
=end

    @entry = Jot.new(entry_params)
    @entry.tag_id = AssignTag.new(@entry.tag, current_user.id).id
    @entry.title_without_tag = @entry.title

    respond_to do |format|
      if @entry.save
        format.html do
         redirect_to URI(request.referer).path,
          notice: 'Jot was successfully created.'
       end
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to entries_path, notice: 'Jot was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Jot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_entry
      @entry = Jot.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:entry, :body, :user_id)
    end
end
