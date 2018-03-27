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

ActiveRecord::Schema.define(version: 20180327085652) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "sipping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goodbyes", force: :cascade do |t|
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
  end

  create_table "histories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "total_price"
    t.string "status_id"
    t.string "delivery_id"
    t.string "payment_id"
    t.text "send_address"
    t.integer "send_postal_code"
    t.string "send_name_kanji"
    t.string "send_name_kana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "history_statuses", force: :cascade do |t|
    t.string "history_status_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_carts", force: :cascade do |t|
    t.integer "item_id"
    t.integer "cart_id"
    t.integer "item_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_genres", force: :cascade do |t|
    t.integer "item_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.integer "stock"
    t.string "artist_name"
    t.text "jacket_image_id"
    t.integer "price"
    t.string "label"
    t.integer "item_status_id"
    t.date "release_date_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payway"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "item_id"
    t.integer "history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_count"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tunes", force: :cascade do |t|
    t.integer "item_id"
    t.string "tune_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cart_id"
    t.string "user_name_kanji"
    t.string "user_name_kana"
    t.text "address"
    t.string "postal_code"
    t.string "phone_number"
    t.datetime "soft_destroyed_at"
    t.index ["email", "soft_destroyed_at"], name: "index_users_on_email_and_soft_destroyed_at", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["soft_destroyed_at"], name: "index_users_on_soft_destroyed_at"
  end

end
