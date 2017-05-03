# == Schema Information
#
# Table name: messages
#
#  id             :integer          not null, primary key
#  message        :text
#  user_id        :integer
#  target_user_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_messages_on_target_user_id              (target_user_id)
#  index_messages_on_user_id                     (user_id)
#  index_messages_on_user_id_and_target_user_id  (user_id,target_user_id)
#

class Message < ApplicationRecord
end
