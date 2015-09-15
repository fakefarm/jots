class ArchivePresenter
  attr_reader :current_user

  def initialize(current_user, date='')
    @current_user = current_user
    @date = date
  end

  def entries
    Jot.archives_before_today(current_user.id)
  end

  def entries_for_day
    @entries = Jot.where(user_id: current_user.id).where("DATE(created_at) = ?", @date).reverse
  end
end
