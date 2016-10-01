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

ActiveRecord::Schema.define(version: 20160928025826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.float    "price_per_km"
    t.string   "address"
    t.float    "tax"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.integer  "views",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "complaints", force: :cascade do |t|
    t.text     "text"
    t.integer  "exam_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "complaints", ["exam_id"], name: "index_complaints_on_exam_id", using: :btree
  add_index "complaints", ["user_id"], name: "index_complaints_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "exam_images", force: :cascade do |t|
    t.text     "image_uncompressed"
    t.string   "image_compressed"
    t.string   "image_black_and_white"
    t.integer  "exam_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "exam_images", ["exam_id"], name: "index_exam_images_on_exam_id", using: :btree

  create_table "exams", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "user_id"
    t.boolean  "visible",          default: false
    t.integer  "views",            default: 0
    t.float    "period"
    t.string   "name"
    t.string   "professor_name"
    t.float    "feedback_avarage", default: 0.0
    t.boolean  "processed",        default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "exams", ["subject_id"], name: "index_exams_on_subject_id", using: :btree
  add_index "exams", ["user_id"], name: "index_exams_on_user_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["exam_id"], name: "index_favorites_on_exam_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "grade"
    t.integer  "exam_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requisitions", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "requisitions", ["user_id"], name: "index_requisitions_on_user_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "UF"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_id"
    t.boolean  "visible",       default: true
    t.integer  "exams_counter", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "subjects", ["course_id"], name: "index_subjects_on_course_id", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.boolean  "visible",    default: true
    t.integer  "views",      default: 0
    t.string   "header"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "universities", ["city_id"], name: "index_universities_on_city_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "given_name"
    t.string   "family_name"
    t.string   "name"
    t.string   "picture_large"
    t.string   "picture"
    t.string   "email"
    t.string   "phone"
    t.string   "birthday"
    t.string   "push_token"
    t.text     "token"
    t.text     "recover_password_token"
    t.text     "password"
    t.boolean  "blocked",                default: false
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "university_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["state_id"], name: "index_users_on_state_id", using: :btree
  add_index "users", ["university_id"], name: "index_users_on_university_id", using: :btree

end
