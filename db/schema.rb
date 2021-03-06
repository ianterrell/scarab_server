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

ActiveRecord::Schema.define(:version => 20100124191755) do

  create_table "apn_devices", :force => true do |t|
    t.string   "token",              :default => "",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_registered_at"
    t.datetime "last_feedback_at"
    t.string   "email"
    t.boolean  "ok_to_email",        :default => true
  end

  add_index "apn_devices", ["token"], :name => "index_apn_devices_on_token", :unique => true

  create_table "apn_notifications", :force => true do |t|
    t.integer  "device_id",                      :null => false
    t.integer  "errors_nb",       :default => 0
    t.string   "device_language"
    t.string   "sound"
    t.string   "alert"
    t.integer  "badge"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apn_notifications", ["device_id"], :name => "index_apn_notifications_on_device_id"

  create_table "apple_payments", :force => true do |t|
    t.integer  "quarter_id"
    t.string   "code",       :limit => 8
    t.string   "region",     :limit => 32
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.integer  "user_id"
    t.text     "web_bio"
  end

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

  create_table "feedbacks", :force => true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "footnotes", :force => true do |t|
    t.integer  "interview_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interviews", :force => true do |t|
    t.integer  "number"
    t.integer  "author_id"
    t.text     "body"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "date"
  end

  create_table "issue_payment_portions", :force => true do |t|
    t.integer  "issue_id"
    t.integer  "apple_payment_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", :force => true do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color",                 :limit => 6
    t.datetime "published_at"
    t.string   "title",                 :limit => 32
    t.string   "subtitle",              :limit => 128
    t.string   "product_identifier",    :limit => 64
    t.text     "preview_description"
    t.text     "short_web_description"
    t.text     "long_web_description"
  end

  create_table "mailing_list_recipients", :force => true do |t|
    t.string   "email",      :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", :force => true do |t|
    t.string   "alert"
    t.integer  "badge",      :default => 1
    t.boolean  "sound",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quarters", :force => true do |t|
    t.string   "name",       :limit => 32
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

  create_table "royalty_payments", :force => true do |t|
    t.integer  "author_id"
    t.integer  "quarter_id"
    t.integer  "amount",     :default => 0
    t.datetime "paid_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", :force => true do |t|
    t.integer  "user_id"
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

  create_table "transactions", :force => true do |t|
    t.integer  "issue_id"
    t.integer  "original_transaction_id"
    t.integer  "quantity"
    t.string   "identifier"
    t.string   "product_identifier"
    t.string   "app_identifier"
    t.string   "version_external_identifier"
    t.boolean  "apple_validated"
    t.datetime "purchased_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_giveaway_entries", :force => true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", :force => true do |t|
    t.datetime "published_at"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
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
    t.string   "title"
    t.text     "body"
    t.integer  "author_id"
    t.integer  "issue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "submission_id"
    t.boolean  "prose",              :default => false
    t.integer  "position",           :default => 1
    t.string   "reader"
    t.boolean  "free",               :default => false
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.string   "work_type"
  end

  add_index "works", ["issue_id"], :name => "index_works_on_issue_id"

end
