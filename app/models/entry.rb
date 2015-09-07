class Entry < ActiveRecord::Base
  searchkick
  has_many :entries
end
