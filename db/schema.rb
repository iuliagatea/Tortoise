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

ActiveRecord::Schema.define(version: 20220419170317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.time     "from_time"
    t.time     "to_time"
    t.boolean  "is_honoured", default: false
    t.integer  "service_id"
    t.integer  "customer_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "appointments", ["customer_id"], name: "index_appointments_on_customer_id", using: :btree
  add_index "appointments", ["service_id"], name: "index_appointments_on_service_id", using: :btree

  create_table "availabilities", force: :cascade do |t|
    t.integer  "partner_id"
    t.string   "wday"
    t.datetime "date"
    t.time     "from_time"
    t.time     "to_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "availabilities", ["partner_id"], name: "index_availabilities_on_partner_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "duration"
    t.integer  "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "services", ["partner_id"], name: "index_services_on_partner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "recovery_password_digest"
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.text     "description"
    t.string   "location"
    t.string   "type"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "appointments", "services"
  add_foreign_key "appointments", "users", column: "customer_id"
  add_foreign_key "availabilities", "users", column: "partner_id"
  add_foreign_key "services", "users", column: "partner_id"
end
