json.(@post, :id, :content, :user_id, :created_at, :updated_at)
json.favorited current_user.favorited?(@post)