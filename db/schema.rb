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

ActiveRecord::Schema.define(version: 20171209144959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "act_payments", force: :cascade do |t|
    t.uuid "item_id", null: false
    t.uuid "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_act_payments_on_item_id"
    t.index ["member_id"], name: "index_act_payments_on_member_id"
  end

  create_table "calcs", force: :cascade do |t|
    t.integer "unit", null: false
    t.integer "locale_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon", null: false
    t.string "color", null: false
    t.integer "order", default: 0, null: false
    t.integer "locale_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", limit: 40, null: false
    t.string "description"
    t.integer "locale_id", default: 0, null: false
    t.integer "calc_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_events_on_id"
  end

  create_table "items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "event_id", null: false
    t.integer "category_id", null: false
    t.text "memo"
    t.datetime "registered_at", null: false
    t.integer "tmp_amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_items_on_event_id"
    t.index ["id"], name: "index_items_on_id"
  end

  create_table "locales", force: :cascade do |t|
    t.string "code", limit: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "event_id", null: false
    t.string "name", null: false
    t.integer "order", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_members_on_event_id"
    t.index ["id"], name: "index_members_on_id"
  end

  create_table "tmp_payments", force: :cascade do |t|
    t.uuid "item_id", null: false
    t.uuid "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_tmp_payments_on_item_id"
    t.index ["member_id"], name: "index_tmp_payments_on_member_id"
  end

end
