class AssignTag
  def initialize(jot_tag, current_user_id)
    @jot_tag = jot_tag
    @current_user_id = current_user_id
  end

  def id
    find_tag.id
  end

  def find_tag
    Tag.find_or_create_by(title: @jot_tag, user_id: @current_user_id, title_no_hash: @jot_tag[1..-1])
  end
end
