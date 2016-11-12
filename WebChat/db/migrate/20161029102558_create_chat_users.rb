class CreateChatUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_users do |t|
      t.string :name
      t.string :login
      t.string :password
      t.belongs_to :role, :class_name => 'Role'
    end
  end
end
