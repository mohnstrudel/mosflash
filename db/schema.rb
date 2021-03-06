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

ActiveRecord::Schema.define(version: 20161203164719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "accompanships", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "accompany_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "additionalcharacteristics", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "additionalcharacteristics", ["product_id"], name: "index_additionalcharacteristics_on_product_id", using: :btree

  create_table "addservices", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "toparty"
    t.string   "amount_name"
    t.integer  "amount"
  end

  create_table "blogposts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author"
    t.text     "leadparagraph"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "avatar"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "avatar"
    t.integer  "orderid"
    t.string   "slug"
  end

  create_table "characteristics", force: :cascade do |t|
    t.float    "weight"
    t.float    "length"
    t.float    "width"
    t.float    "thickness"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "characteristics", ["product_id"], name: "index_characteristics_on_product_id", using: :btree

  create_table "colorizations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "colorizations", ["color_id"], name: "index_colorizations_on_color_id", using: :btree
  add_index "colorizations", ["product_id"], name: "index_colorizations_on_product_id", using: :btree

  create_table "colors", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "csscolor"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "coefficient"
  end

  create_table "hot_pics", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
  end

  add_index "hot_pics", ["product_id"], name: "index_hot_pics_on_product_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["product_id"], name: "index_images_on_product_id", using: :btree

  create_table "keywords", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "quantity",    default: 1
    t.integer  "order_id"
    t.hstore   "addservices"
    t.float    "sellprice"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "makets", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.string   "maket_type"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "makets", ["product_id"], name: "index_makets_on_product_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "mail"
    t.text     "description"
    t.text     "calling"
    t.text     "cite"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "avatar"
  end

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
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "company"
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.string   "phone"
    t.string   "mail"
    t.string   "pay_type"
    t.string   "delivery_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "building"
    t.string   "fathername"
    t.string   "room"
    t.float    "totalsum"
  end

  create_table "product_keywords", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_keywords", ["keyword_id"], name: "index_product_keywords_on_keyword_id", using: :btree
  add_index "product_keywords", ["product_id"], name: "index_product_keywords_on_product_id", using: :btree

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
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.boolean  "hot"
    t.string   "hotpic"
    t.string   "color"
    t.string   "material"
    t.float    "basicprice"
    t.string   "previewpic"
    t.integer  "sorting"
    t.string   "seo_title"
    t.text     "seo_description"
    t.string   "slug"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["subcategory_id"], name: "index_products_on_subcategory_id", using: :btree

  create_table "servizations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "addservice_id"
    t.float    "coefficient"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "servizations", ["addservice_id"], name: "index_servizations_on_addservice_id", using: :btree
  add_index "servizations", ["product_id"], name: "index_servizations_on_product_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "facebook"
    t.string   "vk"
    t.string   "instagram"
    t.string   "youtube"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.string   "avatar"
    t.string   "slug"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volumes", force: :cascade do |t|
    t.float    "value"
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

  add_foreign_key "additionalcharacteristics", "products"
  add_foreign_key "characteristics", "products"
  add_foreign_key "hot_pics", "products"
  add_foreign_key "images", "products"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "makets", "products"
  add_foreign_key "option_pics", "options"
  add_foreign_key "product_keywords", "keywords"
  add_foreign_key "product_keywords", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "subcategories"
  add_foreign_key "subcategories", "categories"
end
