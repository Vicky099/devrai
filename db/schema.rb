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

ActiveRecord::Schema.define(version: 20180322094300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commitees", force: :cascade do |t|
    t.string "name"
    t.string "designation"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio"
  end

  create_table "gallaries", force: :cascade do |t|
    t.string "name"
    t.datetime "photo_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_contents", force: :cascade do |t|
    t.text "site_header"
    t.text "site_menu"
    t.text "content1_header"
    t.text "content1_desc"
    t.text "content2_header"
    t.text "content2_sub_header"
    t.text "content2_desc"
    t.text "content3_header"
    t.text "content3_desc"
    t.text "content4_header"
    t.text "content4_thought1_desc"
    t.text "content4_thought1_name"
    t.text "content4_thought1_position"
    t.text "content4_thought2_desc"
    t.text "content4_thought2_name"
    t.text "content4_thought2_position"
    t.text "content4_thought3_desc"
    t.text "content4_thought3_name"
    t.text "content4_thought3_position"
    t.text "content5_header"
    t.text "content6_header"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.string "mobile_number"
    t.string "email_id"
    t.string "village"
    t.string "taluka"
    t.string "district"
    t.string "state"
    t.text "about_me"
    t.text "about_devrai"
    t.integer "tree_planted_count", default: 0
    t.string "membership", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "date_of_birth"
    t.string "contact_no"
    t.text "address"
    t.string "city"
    t.string "state"
    t.boolean "admin", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "active", default: true
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
