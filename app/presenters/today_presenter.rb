class TodayPresenter
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def entries
    Jot.today_for_user(current_user.id)
  end
end
