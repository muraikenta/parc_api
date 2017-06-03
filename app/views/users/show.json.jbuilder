json.call(
  @user,
  :id,
  :name,
  :username,
  :email,
  :image,
  :posts_count,
  :favorites_count,
  :followings_count,
  :followers_count,
)
json.following current_user.follow?(@user)
