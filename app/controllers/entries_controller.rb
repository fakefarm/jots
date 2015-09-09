class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.where(user_id: current_user.id).
                     where("DATE(created_at) = ?", Date.today).
                     reverse
  end

  def show; end

  def new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)

    # _dw TODO move into a service model

    @tags = params[:entry][:title].split(' ').select do |t|
      t.include?('#')
    end

    t = Tag.find_or_create_by(title: @tags[0], user_id: current_user.id)
    @entry.tag_id = t.id

    @entry.title = params[:entry][:title].split(' ').select do |t|
      t.exclude?('#')
    end.join(' ')

    respond_to do |format|
      if @entry.save
        format.html { redirect_to entries_path, notice: 'Entry was successfully created.' }
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
        format.html { redirect_to entries_path, notice: 'Entry was successfully updated.' }
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
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:title, :body, :user_id)
    end
end
