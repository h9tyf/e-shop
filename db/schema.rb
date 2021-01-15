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

ActiveRecord::Schema.define(version: 2021_01_10_141803) do

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_option_id", null: false
    t.boolean "isSelected"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_option_id"], name: "index_carts_on_product_option_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.boolean "isSelected"
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "my_transactions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "phone"
    t.index ["user_id"], name: "index_my_transactions_on_user_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.string "description"
    t.float "price"
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "shop_id", null: false
    t.string "graph_link"
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "solds", force: :cascade do |t|
    t.integer "product_option_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "phone"
    t.float "amount"
    t.index ["product_option_id"], name: "index_solds_on_product_option_id"
    t.index ["user_id"], name: "index_solds_on_user_id"
  end

  create_table "transaction_product_tables", force: :cascade do |t|
    t.integer "my_transaction_id", null: false
    t.integer "product_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["my_transaction_id"], name: "index_transaction_product_tables_on_my_transaction_id"
    t.index ["product_option_id"], name: "index_transaction_product_tables_on_product_option_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "product_options", on_delete: :cascade
  add_foreign_key "carts", "users", on_delete: :cascade
  add_foreign_key "favorites", "products", on_delete: :cascade
  add_foreign_key "favorites", "users", on_delete: :cascade
  add_foreign_key "my_transactions", "users", on_delete: :cascade
  add_foreign_key "product_options", "products", on_delete: :cascade
  add_foreign_key "products", "shops", on_delete: :cascade
  add_foreign_key "shops", "users", on_delete: :cascade
  add_foreign_key "solds", "product_options", on_delete: :cascade
  add_foreign_key "solds", "users", on_delete: :cascade
  add_foreign_key "transaction_product_tables", "my_transactions", on_delete: :cascade
  add_foreign_key "transaction_product_tables", "product_options", on_delete: :cascade
end
