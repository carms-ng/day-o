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

ActiveRecord::Schema.define(version: 2020_03_05_185053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_completions", force: :cascade do |t|
    t.bigint "challenge_subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "action_id"
    t.index ["action_id"], name: "index_action_completions_on_action_id"
    t.index ["challenge_subscription_id"], name: "index_action_completions_on_challenge_subscription_id"
  end

  create_table "action_settings", force: :cascade do |t|
    t.boolean "checked", default: false
    t.boolean "habit", default: false
    t.bigint "challenge_subscription_id"
    t.bigint "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_action_settings_on_action_id"
    t.index ["challenge_subscription_id"], name: "index_action_settings_on_challenge_subscription_id"
  end

  create_table "actions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "impact"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_actions_on_challenge_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
  end

  create_table "challenge_categories", force: :cascade do |t|
    t.bigint "challenge_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_challenge_categories_on_category_id"
    t.index ["challenge_id"], name: "index_challenge_categories_on_challenge_id"
  end

  create_table "challenge_subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_challenge_subscriptions_on_challenge_id"
    t.index ["user_id"], name: "index_challenge_subscriptions_on_user_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.integer "num_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "difficulty"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "location"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "action_completions", "challenge_subscriptions"
  add_foreign_key "action_settings", "actions"
  add_foreign_key "action_settings", "challenge_subscriptions"
  add_foreign_key "actions", "challenges"
  add_foreign_key "challenge_categories", "categories"
  add_foreign_key "challenge_categories", "challenges"
  add_foreign_key "challenge_subscriptions", "challenges"
  add_foreign_key "challenge_subscriptions", "users"
end
