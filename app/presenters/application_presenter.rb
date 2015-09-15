class ApplicationPresenter
  attr_reader :current_user

  def initialize(current_user, options={})
    @current_user = current_user
    # @current_user = options[:user]
    @tag = options[:tag]
  end

  def archives
    Jot.archives_before_today(current_user.id)
  end

  def tag_list
    Tag.list_for_user(current_user.id)
  end

  def today
    Jot.today_for_user(current_user.id)
  end

  def tagged_jots
    tag = Tag.where(title_no_hash: @tag).first.id
    Jot.where(tag_id: tag, user_id: current_user.id)
  end
end


