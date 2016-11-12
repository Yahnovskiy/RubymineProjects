# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161029104344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blacklists", force: :cascade do |t|
    t.integer "chat_user_id"
    t.index ["chat_user_id"], name: "index_blacklists_on_chat_user_id", using: :btree
  end

  create_table "chat_users", force: :cascade do |t|
    t.string  "name"
    t.string  "login"
    t.string  "password"
    t.integer "role_id"
    t.index ["role_id"], name: "index_chat_users_on_role_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string  "body"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
  end

end
