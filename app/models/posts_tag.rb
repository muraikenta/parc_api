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

class PostsTag < ApplicationRecord
end
