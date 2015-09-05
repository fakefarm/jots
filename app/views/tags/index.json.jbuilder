json.array!(@tags) do |tag|
  json.extract! tag, :id, :title, :user_id
  json.url tag_url(tag, format: :json)
end
