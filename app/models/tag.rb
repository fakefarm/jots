class Tag < ActiveRecord::Base
  has_many :entries
end
