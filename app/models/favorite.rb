# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_favorites_on_post_id              (post_id)
#  index_favorites_on_user_id              (user_id)
#  index_favorites_on_user_id_and_post_id  (user_id,post_id)
#

class Favorite < ApplicationRecord
end
