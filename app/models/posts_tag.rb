# == Schema Information
#
# Table name: posts_tags
#
#  id         :integer          not null, primary key
#  post_id_id :integer
#  tag_id_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_tags_on_post_id_and_tag_id  (,) UNIQUE
#  index_posts_tags_on_post_id_id          (post_id_id)
#  index_posts_tags_on_tag_id_id           (tag_id_id)
#

class PostsTag < ApplicationRecord
  validates :post, presence: true
  validates :tag, presence: true
  validates :post_id, uniqueness: { scope: [:tag_id] }
end
