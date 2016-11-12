class ChatUser < ApplicationRecord
  belongs_to :role, :class_name => 'Role', foreign_key: 'role_id'

end
