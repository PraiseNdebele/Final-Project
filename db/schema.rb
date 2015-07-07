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

ActiveRecord::Schema.define(version: 20150707161712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.date     "end_date"
    t.boolean  "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.datetime "date"
    t.text     "details"
    t.integer  "projected_mark"
    t.integer  "actual_mark"
    t.integer  "deviation"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "course_id"
  end

  add_index "goals", ["course_id"], name: "index_goals_on_course_id", using: :btree
  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "importants", force: :cascade do |t|
    t.datetime "date"
    t.string   "event"
    t.text     "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "course_id"
  end

  add_index "importants", ["course_id"], name: "index_importants_on_course_id", using: :btree
  add_index "importants", ["user_id"], name: "index_importants_on_user_id", using: :btree

  create_table "tdls", force: :cascade do |t|
    t.date     "date"
    t.text     "task"
    t.boolean  "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "course_id"
  end

  add_index "tdls", ["course_id"], name: "index_tdls_on_course_id", using: :btree
  add_index "tdls", ["user_id"], name: "index_tdls_on_user_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.string   "document"
    t.integer  "course_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  add_index "uploads", ["course_id"], name: "index_uploads_on_course_id", using: :btree
  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id", using: :btree

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
    t.string   "firstname"
    t.string   "lastname"
    t.date     "graduation_year"
    t.string   "institution"
    t.string   "major"
    t.string   "career_field"
    t.text     "bio"
    t.integer  "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "courses", "users"
  add_foreign_key "goals", "courses"
  add_foreign_key "goals", "users"
  add_foreign_key "importants", "courses"
  add_foreign_key "importants", "users"
  add_foreign_key "tdls", "courses"
  add_foreign_key "tdls", "users"
  add_foreign_key "uploads", "courses"
  add_foreign_key "uploads", "users"
end
