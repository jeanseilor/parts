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

ActiveRecord::Schema.define(version: 20171110125135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "Street"
    t.string   "address"
    t.string   "district"
    t.string   "city"
    t.integer  "number"
    t.string   "complement"
    t.string   "state"
    t.string   "zipCode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "member_id"
    t.index ["member_id"], name: "index_addresses_on_member_id", using: :btree
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "ads", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "member_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "price_cents"
    t.integer  "company_part_id"
    t.index ["company_part_id"], name: "index_ads_on_company_part_id", using: :btree
    t.index ["member_id"], name: "index_ads_on_member_id", using: :btree
  end

  create_table "cars", force: :cascade do |t|
    t.string   "maker"
    t.date     "year"
    t.date     "year_make"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "model_id"
    t.index ["model_id"], name: "index_cars_on_model_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_members", id: false, force: :cascade do |t|
    t.integer "member_id",  null: false
    t.integer "company_id", null: false
  end

  create_table "company_members", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_members_on_company_id", using: :btree
    t.index ["member_id"], name: "index_company_members_on_member_id", using: :btree
  end

  create_table "company_parts", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_parts_on_company_id", using: :btree
    t.index ["part_id"], name: "index_company_parts_on_part_id", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_members_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  end

  create_table "models", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "part_details", force: :cascade do |t|
    t.integer  "price_cents"
    t.boolean  "negotiabel"
    t.integer  "quantity"
    t.integer  "company_part_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["company_part_id"], name: "index_part_details_on_company_part_id", using: :btree
  end

  create_table "part_promotions", force: :cascade do |t|
    t.integer  "needed_buy"
    t.integer  "price_cents"
    t.integer  "stock_quantity"
    t.integer  "company_part_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["company_part_id"], name: "index_part_promotions_on_company_part_id", using: :btree
  end

  create_table "parts", force: :cascade do |t|
    t.integer  "car_id"
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["car_id"], name: "index_parts_on_car_id", using: :btree
    t.index ["category_id"], name: "index_parts_on_category_id", using: :btree
  end

  create_table "phones", force: :cascade do |t|
    t.string   "phone"
    t.boolean  "active"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_phones_on_member_id", using: :btree
  end

  create_table "solds", force: :cascade do |t|
    t.integer  "company_part_id"
    t.integer  "member_id"
    t.integer  "price_cents"
    t.integer  "quantity"
    t.boolean  "promotion"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["company_part_id"], name: "index_solds_on_company_part_id", using: :btree
    t.index ["member_id"], name: "index_solds_on_member_id", using: :btree
  end

  add_foreign_key "addresses", "members"
  add_foreign_key "ads", "company_parts"
  add_foreign_key "ads", "members"
  add_foreign_key "cars", "models"
  add_foreign_key "company_members", "companies"
  add_foreign_key "company_members", "members"
  add_foreign_key "company_parts", "companies"
  add_foreign_key "company_parts", "parts"
  add_foreign_key "part_details", "company_parts"
  add_foreign_key "part_promotions", "company_parts"
  add_foreign_key "parts", "cars"
  add_foreign_key "parts", "categories"
  add_foreign_key "phones", "members"
  add_foreign_key "solds", "company_parts"
  add_foreign_key "solds", "members"
end
