class Tag < ActiveRecord::Base
  has_many :entries
  validates :title, :user_id, presence: true

  def self.list_for_user(id)
    Tag.where(user_id: id)
  end
end
