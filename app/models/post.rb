# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  content         :text
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  favorites_count :integer          default("0")
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  validates :user, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, through: :favorites, source: :user

  scope :ordered, -> { order(created_at: :desc) }
end
