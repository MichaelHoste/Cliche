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

ActiveRecord::Schema.define(version: 20160811213706) do

  create_table "missions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name"
    t.string   "tagline"
    t.text     "description", limit: 65535
    t.string   "picture"
    t.decimal  "latitude",                  precision: 12, scale: 8
    t.decimal  "longitude",                 precision: 12, scale: 8
    t.boolean  "enabled",                                            default: false
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  create_table "spots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "mission_id"
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "picture"
    t.decimal  "latitude",                  precision: 12, scale: 8
    t.decimal  "longitude",                 precision: 12, scale: 8
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["mission_id"], name: "index_spots_on_mission_id", using: :btree
  end

  create_table "user_spot_links", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.string   "picture"
    t.boolean  "validated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_user_spot_links_on_spot_id", using: :btree
    t.index ["user_id"], name: "index_user_spot_links_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "spots", "missions"
  add_foreign_key "user_spot_links", "spots"
  add_foreign_key "user_spot_links", "users"
end
