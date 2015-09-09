class Entry < ActiveRecord::Base
  belongs_to :tag

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
