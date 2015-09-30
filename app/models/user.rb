class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jots
  has_many :tags

  # def self.archives # _dw Should I try this? IF so, how?
  #   Jot.archives_for_user(User.id)
  # end

end
