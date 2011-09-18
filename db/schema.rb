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

ActiveRecord::Schema.define(:version => 20110906144012) do

  create_table "images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "filename"
    t.integer  "user_id",    :default => 1
  end

  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

  create_table "votes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "overall_score"
    t.integer  "tops_score"
    t.integer  "pants_score"
    t.integer  "shoes_score"
    t.integer  "accessories_score"
    t.integer  "user_id"
    t.integer  "image_id"
  end

  add_index "votes", ["accessories_score"], :name => "index_votes_on_accessories_score"
  add_index "votes", ["image_id"], :name => "index_votes_on_image_id"
  add_index "votes", ["overall_score"], :name => "index_votes_on_overall_score"
  add_index "votes", ["pants_score"], :name => "index_votes_on_pants_score"
  add_index "votes", ["shoes_score"], :name => "index_votes_on_shoes_score"
  add_index "votes", ["tops_score"], :name => "index_votes_on_tops_score"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
