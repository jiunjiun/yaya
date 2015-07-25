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

ActiveRecord::Schema.define(version: 20150725083931) do

  create_table "destinations", force: :cascade do |t|
    t.string   "iata",       limit: 255
    t.string   "en",         limit: 255
    t.string   "zh",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string   "terminal",          limit: 255
    t.string   "kind",              limit: 255
    t.string   "code",              limit: 255
    t.string   "code_zh",           limit: 255
    t.string   "flight",            limit: 255
    t.string   "gate",              limit: 255
    t.datetime "datetime"
    t.datetime "expected_datetime"
    t.integer  "destination_id",    limit: 4
    t.string   "flight_status",     limit: 255
    t.string   "aircraft_type",     limit: 255
    t.integer  "other_route_id",    limit: 4
    t.string   "baggage_carousel",  limit: 255
    t.string   "check_in_counter",  limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "flights", ["destination_id"], name: "index_flights_on_destination_id", using: :btree
  add_index "flights", ["other_route_id"], name: "index_flights_on_other_route_id", using: :btree

end
