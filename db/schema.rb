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

ActiveRecord::Schema.define(version: 20130622172637) do

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.decimal  "total_amount", precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price",             precision: 10, scale: 2
    t.decimal  "cost",              precision: 10, scale: 2
    t.integer  "quantity_in_stock"
    t.integer  "quantity_on_order"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["name"], name: "index_products_on_name"
  add_index "products", ["status"], name: "index_products_on_status"

  create_table "transactions", force: true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "amount",     precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["order_id"], name: "index_transactions_on_order_id"
  add_index "transactions", ["product_id"], name: "index_transactions_on_product_id"

end
