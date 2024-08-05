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

ActiveRecord::Schema[7.0].define(version: 2024_08_05_173248) do
  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "quantity"
    t.bigint "supply_id", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["supply_id"], name: "index_products_on_supply_id"
  end

  create_table "shelters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "location_address", null: false
    t.text "contact_info", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "shelter_id", null: false
    t.bigint "supply_id", null: false
    t.integer "total_quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelter_id"], name: "index_stocks_on_shelter_id"
    t.index ["supply_id"], name: "index_stocks_on_supply_id"
  end

  create_table "supplies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name", null: false
    t.string "unit", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_supplies_on_category_id"
  end

  create_table "transactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "shelter_id", null: false
    t.string "transaction_type", null: false
    t.integer "quantity", null: false
    t.date "transaction_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supply_id"
    t.index ["product_id"], name: "index_transactions_on_product_id"
    t.index ["shelter_id"], name: "index_transactions_on_shelter_id"
    t.index ["supply_id"], name: "index_transactions_on_supply_id"
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "supplies"
  add_foreign_key "stocks", "shelters"
  add_foreign_key "stocks", "supplies"
  add_foreign_key "supplies", "categories"
  add_foreign_key "transactions", "products"
  add_foreign_key "transactions", "shelters"
  add_foreign_key "transactions", "supplies"
end
