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

ActiveRecord::Schema.define(version: 2020_07_24_165606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "device_readings", force: :cascade do |t|
    t.bigint "device_id", null: false
    t.bigint "reading_id", null: false
    t.index ["device_id"], name: "index_device_readings_on_device_id"
    t.index ["reading_id"], name: "index_device_readings_on_reading_id"
  end

  create_table "devices", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.integer "status", default: 0
    t.string "kit_id"
    t.string "organization_id"
    t.string "reference"
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "phone_number"
    t.string "email"
    t.string "shipping_address"
    t.string "imei"
  end

  create_table "readings", force: :cascade do |t|
    t.integer "battery_voltage"
    t.integer "signal_strength"
    t.integer "rssi"
    t.integer "unit"
    t.integer "tare"
    t.integer "weight"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
