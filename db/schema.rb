# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130807154558) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "create_credit_line_items", :force => true do |t|
    t.integer  "credit_id"
    t.integer  "order_id"
    t.decimal  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "create_credit_line_items", ["credit_id"], :name => "index_create_credit_line_items_on_credit_id"
  add_index "create_credit_line_items", ["order_id"], :name => "index_create_credit_line_items_on_order_id"

  create_table "credits", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "start_balance", :default => 0.0
    t.decimal  "balance",       :default => 0.0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "credits", ["user_id"], :name => "index_credits_on_user_id"

  create_table "dailyposts", :force => true do |t|
    t.integer  "girl_id"
    t.text     "content"
    t.string   "photo"
    t.string   "linkto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cost"
    t.string   "state"
  end

  create_table "girls", :force => true do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "bwh"
    t.integer  "height"
    t.string   "blood_type"
    t.string   "nationality"
    t.string   "special_skill"
    t.string   "hobby"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "loser_likes", :force => true do |t|
    t.integer  "loser_id"
    t.integer  "girl_id"
    t.string   "title"
    t.string   "state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "dailypost_id"
  end

  create_table "materials", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.decimal  "price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "attachment"
    t.string   "attechment"
  end

  create_table "orders", :force => true do |t|
    t.integer  "credit_id"
    t.decimal  "credit_quantity", :precision => 8, :scale => 2
    t.decimal  "total",           :precision => 8, :scale => 2
    t.string   "number"
    t.string   "state"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "user_id"
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "resourceable"
    t.integer  "resourceable_id"
    t.decimal  "price"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "shares", :force => true do |t|
    t.integer  "user_id"
    t.integer  "dailypost_id"
    t.string   "photo_url"
    t.string   "apk_url"
    t.string   "context"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visit_histories", :force => true do |t|
    t.integer  "dailypost_id"
    t.integer  "user_id"
    t.string   "state"
    t.integer  "visit_count"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
