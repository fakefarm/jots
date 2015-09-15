class JotsController < ApplicationController
  before_action :set_jot, only: [:show, :edit, :update, :destroy]

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
  1. new jot
  2. get my tags
  3. find the tag
  4. add tag id to jot
  5. save
=end

    @jot = Jot.new(jot_params)
    @jot.tag_id = AssignTag.new(@jot.tag, current_user.id).id
    @jot.title_without_tag = @jot.title

    respond_to do |format|
      if @jot.save
        format.html do
         redirect_to URI(request.referer).path,
          notice: 'Jot was successfully created.'
       end
        format.json { render :show, status: :created, location: @jot }
      else
        format.html { render :new }
        format.json { render json: @jot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @jot.update(jot_params)
        format.html { redirect_to entries_path, notice: 'Jot was successfully updated.' }
        format.json { render :show, status: :ok, location: @jot }
      else
        format.html { render :edit }
        format.json { render json: @jot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @jot.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Jot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_jot
      @jot = Jot.find(params[:id])
    end

    def jot_params
      params.require(:jot).permit(:jot, :body, :user_id)
    end
end
