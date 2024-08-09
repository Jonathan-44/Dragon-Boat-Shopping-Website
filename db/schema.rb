# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_08_05_001006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "boats", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.text "features"
    t.bigint "cart_id"
    t.boolean "is_on_sale"
    t.bigint "vendor_id"
    t.boolean "sold", default: false
    t.decimal "discount"
    t.index ["cart_id"], name: "index_boats_on_cart_id"
    t.index ["vendor_id"], name: "index_boats_on_vendor_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "shopper_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopper_id"], name: "index_carts_on_shopper_id"
  end

  create_table "dragon_races", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "credit_card_number"
    t.string "expiration_date"
    t.string "cvv"
    t.bigint "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shopper_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
  end

  create_table "placements", force: :cascade do |t|
    t.string "race_name"
    t.date "date"
    t.string "participant"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dragon_race_id", null: false
    t.index ["dragon_race_id"], name: "index_placements_on_dragon_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "boat_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shopper_id", null: false
    t.index ["boat_id"], name: "index_reviews_on_boat_id"
    t.index ["shopper_id"], name: "index_reviews_on_shopper_id"
  end

  create_table "sales_reports", force: :cascade do |t|
    t.bigint "boat_id", null: false
    t.bigint "vendor_id", null: false
    t.bigint "order_id", null: false
    t.datetime "sold_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_sales_reports_on_boat_id"
    t.index ["order_id"], name: "index_sales_reports_on_order_id"
    t.index ["vendor_id"], name: "index_sales_reports_on_vendor_id"
  end

  create_table "shoppers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_shoppers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shoppers_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_vendors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "boats", "carts"
  add_foreign_key "boats", "vendors"
  add_foreign_key "carts", "shoppers"
  add_foreign_key "orders", "carts"
  add_foreign_key "placements", "dragon_races"
  add_foreign_key "reviews", "boats"
  add_foreign_key "reviews", "shoppers"
  add_foreign_key "sales_reports", "boats"
  add_foreign_key "sales_reports", "orders"
  add_foreign_key "sales_reports", "vendors"
end
