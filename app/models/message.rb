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

class Message < ApplicationRecord
end
