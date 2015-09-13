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

  def self.archives_before_today(current_user)
    self.archives_for_user(current_user.id)
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

private

  def self.archives_for_user(id) # _dw should this be in User?
    @archives_with_today = self.where(user_id: id).inject([]) { |memo, entry| memo.push entry.created_at.to_date; memo }
    self.remove_today_from_archvies
  end

  def self.remove_today_from_archvies
    @archives_with_today.select do |a|
      a.to_date < Date.today
    end.uniq || []
  end
end
