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

ActiveRecord::Schema.define(version: 20170829024339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blacklists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "author_id"
    t.integer  "tag_id"
    t.string   "phrase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmark_bookmark_tags", force: :cascade do |t|
    t.integer  "bookmark_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bookmark_tags", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.integer  "tag_id"
    t.string   "description"
    t.boolean  "is_private"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.text     "chapter_summary"
    t.integer  "chapter_number"
    t.text     "body_text"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "work_id"
    t.string   "title"
    t.string   "body_image_file_name"
    t.string   "body_image_content_type"
    t.integer  "body_image_file_size"
    t.datetime "body_image_updated_at"
    t.string   "body_audio_file_name"
    t.string   "body_audio_content_type"
    t.integer  "body_audio_file_size"
    t.datetime "body_audio_updated_at"
    t.string   "chapter_audio_data"
    t.index ["work_id"], name: "index_chapters_on_work_id", using: :btree
  end

  create_table "collections", force: :cascade do |t|
    t.integer  "mod_id"
    t.datetime "date_open"
    t.datetime "date_closed"
    t.integer  "moderation_type"
    t.string   "challenge_description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.integer  "type_id"
    t.boolean  "viewed"
    t.boolean  "finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "work_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.string   "subject"
    t.text     "body"
    t.boolean  "is_admin"
    t.boolean  "read"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "moderation_types", force: :cascade do |t|
    t.integer  "moderation_type"
    t.string   "moderation_description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "series", force: :cascade do |t|
    t.text     "series_summary"
    t.boolean  "is_complete"
    t.integer  "total_works"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "series_users", force: :cascade do |t|
    t.integer  "series_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscription_pages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.boolean  "finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.integer  "subscribee_id"
    t.boolean  "is_user_subscription"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "type_key"
  end

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "type_title"
    t.string   "type_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "user_collections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "collection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "work_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_types", force: :cascade do |t|
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "type_key"
    t.string   "type_name"
  end

  create_table "work_users", force: :cascade do |t|
    t.integer  "work_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.text     "work_summary"
    t.boolean  "is_series"
    t.boolean  "is_complete"
    t.integer  "series_id"
    t.integer  "collection_id"
    t.integer  "word_count"
    t.integer  "total_chapters"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "users_id"
    t.string   "title"
    t.integer  "work_type"
    t.index ["users_id"], name: "index_works_on_users_id", using: :btree
  end

  add_foreign_key "works", "users"
end
