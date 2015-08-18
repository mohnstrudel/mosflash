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

ActiveRecord::Schema.define(version: 20150816140650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["product_id"], name: "index_images_on_product_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "option_pics", force: :cascade do |t|
    t.string   "product_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "option_id"
  end

  add_index "option_pics", ["option_id"], name: "index_option_pics_on_option_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "size"
    t.integer  "weight"
    t.string   "material"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_sizes", force: :cascade do |t|
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_sizes_products", id: false, force: :cascade do |t|
    t.integer "product_id",      null: false
    t.integer "product_size_id", null: false
  end

  add_index "product_sizes_products", ["product_id"], name: "index_product_sizes_products_on_product_id", using: :btree
  add_index "product_sizes_products", ["product_size_id"], name: "index_product_sizes_products_on_product_size_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "description"
    t.integer  "sku"
    t.text     "advertising_text"
    t.text     "fancy_quote"
    t.string   "avatar"
    t.json     "avatars"
    t.integer  "category_id"
    t.integer  "subcategory_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["subcategory_id"], name: "index_products_on_subcategory_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "volumes", force: :cascade do |t|
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "voluminazations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "volume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "voluminazations", ["product_id"], name: "index_voluminazations_on_product_id", using: :btree
  add_index "voluminazations", ["volume_id"], name: "index_voluminazations_on_volume_id", using: :btree

  add_foreign_key "images", "products"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "products"
  add_foreign_key "option_pics", "options"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "subcategories"
end
