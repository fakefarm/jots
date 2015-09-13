class Entry < ActiveRecord::Base
  belongs_to :tag
  belongs_to :user
  attr_accessor :requester

  def self.search(query)
    where("title_without_tag like ?", "%#{query}%")
  end

  def self.today_for_user(id) # _dw should this be in User?
    today = Date.today
    range = (today.beginning_of_day)..(today.end_of_day)
    Entry.where(user_id: id).
          where(:created_at => range).order('id DESC')
  end

  def self.archives_for_user(id) # _dw should this be in User?
    self.where(user_id: id).inject([]) { |memo, entry| memo.push entry.created_at.to_date; memo }.uniq[1..-1] || []
  end

  def tag
    self.entry.split(' ').select do |t|
      t.include?('#')
    end[0]
  end

  def title
    self.entry.split(' ').select do |t|
      t.exclude?('#')
    end.join(' ')
  end
end
