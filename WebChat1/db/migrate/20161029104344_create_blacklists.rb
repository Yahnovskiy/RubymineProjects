class CreateBlacklists < ActiveRecord::Migration[5.0]
  def change
    create_table :blacklists do |t|
      t.references :chat_user, index: true
    end
  end
end
