# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090611175048) do

  create_table "bios", :force => true do |t|
    t.string   "name",       :limit => 64
    t.string   "phone",      :limit => 16
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 64
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", :force => true do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color",        :limit => 6
    t.datetime "published_at"
    t.string   "title",        :limit => 32
    t.string   "subtitle",     :limit => 128
  end

  create_table "mailing_list_recipients", :force => true do |t|
    t.string   "email",      :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "body"
    t.text     "answer"
    t.integer  "position"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
    t.boolean  "editor",                                   :default => false
    t.boolean  "has_promise",                              :default => false
    t.string   "reset_code",                :limit => 40
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "works", :force => true do |t|
    t.integer  "user_id"
    t.integer  "issue_id"
    t.string   "state",                 :limit => 64
    t.string   "title",                 :limit => 512
    t.boolean  "agree_to_terms",                       :default => false
    t.boolean  "prose",                                :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "promoted_at"
    t.datetime "rejected_at"
    t.datetime "accepted_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

end
