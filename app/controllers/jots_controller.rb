class JotsController < ApplicationController
  before_action :set_jot, only: [:show, :edit, :update, :destroy]

  def index
    @jots = Jot.where(user_id: current_user.id).
                     where("DATE(created_at) = ?", Date.today).
                     reverse
  end

  def show; end

  def new
  end

  def edit
  end

  def create
    @jot = Jot.new(jot_params)

    if @jot.tag?
      @jot.tag_id = AssignTag.new(@jot.tag, current_user.id).id
    end

    @jot.title_without_tag = @jot.remove_tag_from_title

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
        format.html { redirect_to jots_path, notice: 'Jot was successfully updated.' }
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
      format.html { redirect_to jots_url, notice: 'Jot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_jot
      @jot = Jot.find(params[:id])
    end

    def jot_params
      params.require(:jot).permit(:title, :body, :user_id, :name, :tag_id)
    end
end
