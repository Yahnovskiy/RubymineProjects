class CreateChatUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_users do |t|
      t.string :name
      t.string :login
      t.string :password
      t.belongs :role, :class_name => 'Role'
      t.timestamps
    end
  end
end
