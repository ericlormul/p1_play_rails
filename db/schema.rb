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

ActiveRecord::Schema.define(version: 20160502195244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "areas", ["program_id"], name: "index_areas_on_program_id", using: :btree

  create_table "authentications", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "auth_token"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "provider_id"
    t.integer  "session_id"
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "nickname"
    t.date     "birthday"
    t.integer  "location_id"
    t.string   "role"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "program_id"
    t.string   "url"
    t.string   "caption"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["program_id"], name: "index_photos_on_program_id", using: :btree

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "photo_id"
    t.integer  "provider_id"
    t.string   "website"
    t.string   "category"
    t.integer  "age_start"
    t.integer  "age_end"
    t.text     "refund_policy"
    t.text     "syllabus"
    t.text     "application_detail"
    t.text     "contact_info"
    t.tsvector "tsv"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "summary"
  end

  add_index "programs", ["tsv"], name: "tsv_idx_on_program", using: :gin

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.integer  "location_id"
    t.string   "website"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "providers", ["location_id"], name: "index_providers_on_location_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "name"
    t.text     "detail"
    t.integer  "program_id"
    t.integer  "person_id"
    t.datetime "confirmed_at"
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reviews", ["person_id"], name: "index_reviews_on_person_id", using: :btree
  add_index "reviews", ["program_id"], name: "index_reviews_on_program_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.integer  "capacity"
    t.integer  "program_id"
    t.integer  "location_id"
    t.integer  "start_time_of_day"
    t.integer  "end_time_of_day"
    t.integer  "duration"
    t.integer  "price"
    t.text     "prerequisite"
    t.string   "currency_code"
    t.text     "price_details"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sessions", ["location_id"], name: "index_sessions_on_location_id", using: :btree
  add_index "sessions", ["program_id"], name: "index_sessions_on_program_id", using: :btree

end
