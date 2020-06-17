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

ActiveRecord::Schema.define(version: 2020_06_17_100652) do

  create_table "bookings", force: :cascade do |t|
    t.date "reservation_date"
    t.time "reservation_time"
    t.time "reservation_end_time"
    t.string "status", default: "Approve"
    t.text "cancellation_reason"
    t.text "booking_reason"
    t.integer "room_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_name"
    t.integer "floor"
    t.string "room_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacities", default: 3
    t.index ["capacities"], name: "index_rooms_on_capacities"
    t.index ["floor"], name: "index_rooms_on_floor"
    t.index ["room_name"], name: "index_rooms_on_room_name"
    t.index ["room_type"], name: "index_rooms_on_room_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
