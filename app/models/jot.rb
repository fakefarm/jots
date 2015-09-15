class Jot < ActiveRecord::Base
  belongs_to :tag
  belongs_to :user
  attr_accessor :requester

  def self.search(query)
    where("title_without_tag like ?", "%#{query}%")
  end

  def self.today_for_user(id) # _dw should this be in User?
    today = Date.today
    range = (today.beginning_of_day)..(today.end_of_day)
    Jot.where(user_id: id).
          where(:created_at => range).order('id DESC')
  end

  def self.archives_before_today(current_user)
    self.archives_for_user(current_user)
  end

  def tag
    self.title.split(' ').select do |t|
      t.include?('#')
    end[0]
  end

  def tag?
    !!self.title.split(' ').select do |t|
      t.include?('#')
    end[0]
  end

  def remove_tag_from_title
    self.title.split(' ').select do |t|
      t.exclude?('#')
    end.join(' ')
  end

private

  def self.archives_for_user(id) # _dw should this be in User?
    @archives_with_today = self.where(user_id: id).inject([]) { |memo, jot| memo.push jot.created_at.to_date; memo }.uniq
  end
end
