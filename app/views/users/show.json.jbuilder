json.(@user, :id, :name, :email, :image, :created_at, :updated_at)
json.following current_user.follow?(@user)
