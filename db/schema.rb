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

ActiveRecord::Schema.define(version: 20151003221638) do

  create_table "admin_functions", force: :cascade do |t|
    t.string   "name",         limit: 255,                null: false
    t.string   "magic_number", limit: 255,                null: false
    t.boolean  "enable",       limit: 1,   default: true, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "article_authors", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.string   "cover",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",             limit: 255,                   null: false
    t.text     "content",           limit: 65535,                 null: false
    t.string   "cover",             limit: 255
    t.string   "summary",           limit: 255,                   null: false
    t.date     "auto_post_date"
    t.boolean  "enable",            limit: 1,     default: false, null: false
    t.string   "tag",               limit: 255
    t.integer  "article_author_id", limit: 4,                     null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "groove_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.boolean  "enable",      limit: 1,   default: false, null: false
    t.boolean  "delete_lock", limit: 1,   default: false, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "groove_folders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "grooves", force: :cascade do |t|
    t.string   "name",                 limit: 255,                 null: false
    t.string   "track_0",              limit: 255
    t.string   "track_1",              limit: 255
    t.string   "track_2",              limit: 255
    t.string   "track_3",              limit: 255
    t.string   "track_4",              limit: 255
    t.string   "track_5",              limit: 255
    t.string   "track_6",              limit: 255
    t.string   "track_7",              limit: 255
    t.string   "track_8",              limit: 255
    t.string   "track_9",              limit: 255
    t.string   "track_10",             limit: 255
    t.string   "track_11",             limit: 255
    t.string   "track_12",             limit: 255
    t.string   "track_13",             limit: 255
    t.string   "track_14",             limit: 255
    t.string   "track_15",             limit: 255
    t.integer  "total_bar",            limit: 4,   default: 1,     null: false
    t.boolean  "enable",               limit: 1,   default: false, null: false
    t.boolean  "delete_lock",          limit: 1,   default: false, null: false
    t.integer  "user_id",              limit: 4,                   null: false
    t.integer  "instrument_bundle_id", limit: 4,                   null: false
    t.integer  "time_signature_id",    limit: 4,                   null: false
    t.integer  "groove_categories_id", limit: 4
    t.integer  "groove_folder_id",     limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "instrument_bundles", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.boolean  "enable",                      limit: 1,   default: false, null: false
    t.boolean  "delete_lock",                 limit: 1,   default: false, null: false
    t.integer  "user_id",                     limit: 4
    t.integer  "percussion_instrument_0_id",  limit: 4
    t.integer  "percussion_instrument_1_id",  limit: 4
    t.integer  "percussion_instrument_2_id",  limit: 4
    t.integer  "percussion_instrument_3_id",  limit: 4
    t.integer  "percussion_instrument_4_id",  limit: 4
    t.integer  "percussion_instrument_5_id",  limit: 4
    t.integer  "percussion_instrument_6_id",  limit: 4
    t.integer  "percussion_instrument_7_id",  limit: 4
    t.integer  "percussion_instrument_8_id",  limit: 4
    t.integer  "percussion_instrument_9_id",  limit: 4
    t.integer  "percussion_instrument_10_id", limit: 4
    t.integer  "percussion_instrument_11_id", limit: 4
    t.integer  "percussion_instrument_12_id", limit: 4
    t.integer  "percussion_instrument_13_id", limit: 4
    t.integer  "percussion_instrument_14_id", limit: 4
    t.integer  "percussion_instrument_15_id", limit: 4
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  create_table "percussion_instruments", force: :cascade do |t|
    t.string   "name",        limit: 255,                 null: false
    t.string   "voice",       limit: 255,                 null: false
    t.integer  "location",    limit: 4,                   null: false
    t.boolean  "enable",      limit: 1,   default: false, null: false
    t.boolean  "delete_lock", limit: 1,   default: false, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "role_and_admin_functions", force: :cascade do |t|
    t.integer  "role_id",           limit: 4, null: false
    t.integer  "admin_function_id", limit: 4, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "role_and_admin_functions", ["admin_function_id"], name: "index_role_and_admin_functions_on_admin_function_id", using: :btree
  add_index "role_and_admin_functions", ["role_id"], name: "index_role_and_admin_functions_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.boolean  "enable",     limit: 1,   default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "system_admin_user_and_roles", force: :cascade do |t|
    t.integer  "system_admin_user_id", limit: 4, null: false
    t.integer  "role_id",              limit: 4, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "system_admin_user_and_roles", ["role_id"], name: "index_system_admin_user_and_roles_on_role_id", using: :btree
  add_index "system_admin_user_and_roles", ["system_admin_user_id"], name: "index_system_admin_user_and_roles_on_system_admin_user_id", using: :btree

  create_table "system_admin_users", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "system_records", force: :cascade do |t|
    t.string   "name",       limit: 255, default: "", null: false
    t.string   "value",      limit: 255, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "time_signatures", force: :cascade do |t|
    t.string   "name",          limit: 255,                 null: false
    t.integer  "lower_numeral", limit: 4,                   null: false
    t.integer  "upper_numeral", limit: 4,                   null: false
    t.boolean  "enable",        limit: 1,                   null: false
    t.boolean  "delete_lock",   limit: 1,   default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
