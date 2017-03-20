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

ActiveRecord::Schema.define(version: 20170227190839) do

  create_table "payments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       precision: 12, scale: 2
    t.boolean  "active"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "sale_id"
    t.decimal  "unit_price",  precision: 12, scale: 2
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["product_id"], name: "index_sale_items_on_product_id"
    t.index ["sale_id"], name: "index_sale_items_on_sale_id"
  end

  create_table "sale_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.decimal  "subtotal",       precision: 12, scale: 2
    t.decimal  "discount",       precision: 12, scale: 2
    t.decimal  "total",          precision: 12, scale: 2
    t.integer  "sale_status_id"
    t.integer  "payment_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["payment_id"], name: "index_sales_on_payment_id"
    t.index ["sale_status_id"], name: "index_sales_on_sale_status_id"
  end

end
