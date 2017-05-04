# == Schema Information
#
# Table name: follows
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  target_user_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_follows_on_target_user_id              (target_user_id)
#  index_follows_on_user_id                     (user_id)
#  index_follows_on_user_id_and_target_user_id  (user_id,target_user_id) UNIQUE
#

class Follow < ApplicationRecord
  validates :user, presence: true
  validates :target_user_id, presence: true
  validates :user_id, uniqueness: { scope: [:target_user_id] }

  belongs_to :user
  belongs_to :target_user, class_name: 'User', foreign_key: 'target_user_id'
end
