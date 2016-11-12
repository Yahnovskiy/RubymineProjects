class ChatUser < ApplicationRecord
  belongs_to :role, :class_name => 'Role', foreign_key: 'role_id'

  validates :name,:password, presence: true
  validates :login, uniqueness: {case_sensitive: false}, presence: true

end
