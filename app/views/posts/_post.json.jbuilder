json.call(post, :id, :content, :user, :created_at, :updated_at, :favorites_count)
json.favorited current_user.favorited?(post)
