# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_07_154024) do

  create_table "items", force: :cascade do |t|
    t.string "description", null: false
    t.float "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchase_import_data", force: :cascade do |t|
    t.text "data", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchasers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "purchaser_id", null: false
    t.integer "merchant_id", null: false
    t.integer "count", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "purchase_import_datum_id", null: false
    t.index ["item_id"], name: "index_purchases_on_item_id"
    t.index ["merchant_id"], name: "index_purchases_on_merchant_id"
    t.index ["purchase_import_datum_id"], name: "index_purchases_on_purchase_import_datum_id"
    t.index ["purchaser_id"], name: "index_purchases_on_purchaser_id"
  end

  add_foreign_key "purchases", "items"
  add_foreign_key "purchases", "merchants"
  add_foreign_key "purchases", "purchase_import_data"
  add_foreign_key "purchases", "purchasers"
end
