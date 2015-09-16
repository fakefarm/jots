class Tag < ActiveRecord::Base
  has_many :jots
  validates :title, :user_id, presence: true

  def self.count(current_user)
    Tag.where(user_id: current_user.id).count
  end

  def self.list_for_user(current_user)
    Tag.where(user_id: current_user.id)
  end
end
