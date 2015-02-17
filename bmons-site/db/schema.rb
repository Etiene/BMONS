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

ActiveRecord::Schema.define(version: 20150217153733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alert_logs", force: :cascade do |t|
    t.text     "message"
    t.integer  "status"
    t.string   "recipient"
    t.datetime "datetime"
    t.integer  "alert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "alert_logs", ["alert_id"], name: "index_alert_logs_on_alert_id", using: :btree

  create_table "alerts", force: :cascade do |t|
    t.string   "type"
    t.integer  "frequency"
    t.text     "message"
    t.integer  "threshold"
    t.string   "comparison"
    t.boolean  "active"
    t.integer  "user_id"
    t.integer  "sensor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "alerts", ["sensor_id"], name: "index_alerts_on_sensor_id", using: :btree
  add_index "alerts", ["user_id"], name: "index_alerts_on_user_id", using: :btree

  create_table "beehives", force: :cascade do |t|
    t.string   "name"
    t.text     "position"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "beehives", ["user_id"], name: "index_beehives_on_user_id", using: :btree

  create_table "measurements", force: :cascade do |t|
    t.integer  "value"
    t.datetime "datetime"
    t.integer  "sensor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "measurements", ["sensor_id"], name: "index_measurements_on_sensor_id", using: :btree

  create_table "sensors", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "unity"
    t.integer  "beehive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sensors", ["beehive_id"], name: "index_sensors_on_beehive_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "access_level"
    t.string   "login"
    t.string   "password"
    t.string   "email"
    t.string   "tel"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "alert_logs", "alerts"
  add_foreign_key "alerts", "sensors"
  add_foreign_key "alerts", "users"
  add_foreign_key "beehives", "users"
  add_foreign_key "measurements", "sensors"
  add_foreign_key "sensors", "beehives"
end
