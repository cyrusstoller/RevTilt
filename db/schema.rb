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

ActiveRecord::Schema.define(:version => 20130424221615) do

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "url_type"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "category_id"
    t.string   "address"
    t.string   "display_location"
  end

  add_index "organizations", ["category_id"], :name => "index_organizations_on_category_id"
  add_index "organizations", ["latitude"], :name => "index_organizations_on_latitude"
  add_index "organizations", ["longitude"], :name => "index_organizations_on_longitude"
  add_index "organizations", ["name"], :name => "index_organizations_on_name"

  create_table "relationships_organization_users", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "relationships_organization_users", ["organization_id"], :name => "index_relationships_organization_users_on_organization_id"
  add_index "relationships_organization_users", ["user_id"], :name => "index_relationships_organization_users_on_user_id"

  create_table "reviews", :force => true do |t|
    t.integer  "rating"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "condition_id"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "reviews", ["condition_id"], :name => "index_reviews_on_condition_id"
  add_index "reviews", ["organization_id"], :name => "index_reviews_on_organization_id"
  add_index "reviews", ["rating"], :name => "index_reviews_on_rating"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "username",               :default => "",    :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
