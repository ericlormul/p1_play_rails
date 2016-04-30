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

ActiveRecord::Schema.define(version: 20160429212629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "auth_token"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camps", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "pic_url"
    t.string   "provider"
    t.string   "homepage"
    t.integer  "price"
    t.string   "year"
    t.string   "season"
    t.string   "category"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.tsvector "tsv"
  end

  add_index "camps", ["tsv"], name: "tsv_idx", using: :gin

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
  end

  add_index "programs", ["tsv"], name: "tsv_idx_on_program", using: :gin

end
