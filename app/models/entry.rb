class Entry < ActiveRecord::Base
  has_many :entries

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
