class AssignTag
  def initialize(entry_tag, current_user_id)
    @entry_tag = entry_tag
    # _dw is this okay?
    @current_user_id = current_user_id
  end

  def id
    find_tag.id
  end

  def find_tag
    #  _dw I don't like that this class knows so much about Tag
    # mock this out maybe...
    # require 'pry'; binding.pry
    Tag.find_or_create_by(title: @entry_tag, user_id: @current_user_id, title_no_hash: @entry_tag[1..-1])
  end
end
