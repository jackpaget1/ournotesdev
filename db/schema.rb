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

ActiveRecord::Schema.define(version: 20140814022622) do

  create_table "baskets", force: true do |t|
    t.integer  "cart_id"
    t.integer  "note_id"
    t.string   "buyer_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "note_title"
    t.string   "note_uploader"
    t.string   "note_category"
    t.string   "note_field"
    t.decimal  "note_price",    precision: 8, scale: 2
    t.string   "order_number"
    t.integer  "rand",                                  default: 8
    t.integer  "downloaded",                            default: 0
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "purchased_at"
    t.text     "note_id"
    t.integer  "download"
  end

  create_table "categories", force: true do |t|
    t.string   "type_of_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categs", force: true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "docnotes", force: true do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fields", force: true do |t|
    t.string   "field_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category_id"
  end

  create_table "files", force: true do |t|
    t.string   "profile_id"
    t.string   "category"
    t.string   "field"
    t.string   "subtype"
    t.string   "file_name"
    t.string   "preview_file_name"
    t.string   "price"
    t.string   "downloads"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_id"
    t.string   "cat"
    t.integer  "category_id"
    t.string   "fie"
    t.string   "year"
    t.string   "title"
    t.string   "institute"
    t.string   "grade"
    t.string   "verified"
    t.integer  "downloads"
    t.decimal  "price",       precision: 8, scale: 2
    t.string   "uploader",                            default: "jackpaget"
  end

  create_table "payment_notifications", force: true do |t|
    t.text     "p_params"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cart_id"
  end

  create_table "proffings", force: true do |t|
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proffints", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profs", force: true do |t|
    t.string   "field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualifications", force: true do |t|
    t.string "qual"
    t.string "category_id"
    t.string "field_id"
  end

  create_table "texgs", force: true do |t|
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "textbs", force: true do |t|
    t.string   "field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unigs", force: true do |t|
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "univs", force: true do |t|
    t.string   "field"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upload_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_name",           default: "Uploader"
    t.string   "profile_id",                                  null: false
    t.string   "terms_accepted"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "payment_method",         default: "PayPal"
  end

  create_table "verifieds", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "years", force: true do |t|
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
