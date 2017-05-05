json.array! @posts do |post|
  json.call(post, :id, :content, :user_id, :created_at, :updated_at, :favorites_count)
  json.favorited current_user.favorited?(post)
end
