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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140627093623) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "articles", force: true do |t|
    t.integer  "admin_id"
    t.string   "title"
    t.text     "content"
    t.string   "status"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "articles", ["admin_id"], name: "index_articles_on_admin_id"
  add_index "articles", ["category_id"], name: "index_articles_on_category_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "order"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "stage_id"
    t.integer  "parent_category_id"
  end

  add_index "categories", ["parent_category_id"], name: "index_categories_on_parent_category_id"
  add_index "categories", ["stage_id"], name: "index_categories_on_stage_id"

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "leads", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "business_type"
    t.string   "website"
    t.string   "physical_address_number"
    t.string   "physical_address_floor"
    t.string   "physical_address_building"
    t.string   "physical_address_street"
    t.string   "physical_address_city"
    t.string   "physical_address_county"
    t.string   "postal_address_number"
    t.string   "postal_address_county"
    t.string   "hours"
    t.string   "business_target"
    t.text     "description"
  end

  create_table "product_categories", force: true do |t|
    t.integer  "category_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "product_categories", ["category_id"], name: "index_product_categories_on_category_id"
  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id"

  create_table "product_type_products", force: true do |t|
    t.integer  "product_type_id"
    t.integer  "product_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "product_type_products", ["product_id"], name: "index_product_type_products_on_product_id"
  add_index "product_type_products", ["product_type_id"], name: "index_product_type_products_on_product_type_id"

  create_table "product_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "parent_product_type_id"
  end

  add_index "product_types", ["parent_product_type_id"], name: "index_product_types_on_parent_product_type_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.integer  "rating"
    t.integer  "category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "impressions_count"
    t.boolean  "active"
    t.string   "slug"
    t.string   "address"
    t.float    "lat"
    t.float    "lon"
    t.string   "type"
    t.datetime "time"
  end

  add_index "products", ["slug"], name: "index_products_on_slug"

  create_table "ratings", force: true do |t|
    t.string   "user_id"
    t.integer  "rating"
    t.text     "description"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "username"
  end

  add_index "ratings", ["product_id"], name: "index_ratings_on_product_id"

  create_table "stages", force: true do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
