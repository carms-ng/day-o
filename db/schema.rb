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

ActiveRecord::Schema.define(version: 2020_03_12_175744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_categories", force: :cascade do |t|
    t.bigint "action_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_action_categories_on_action_id"
    t.index ["category_id"], name: "index_action_categories_on_category_id"
  end

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

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "buddy_challenges", force: :cascade do |t|
    t.boolean "status"
    t.bigint "sender_subscription_id"
    t.bigint "receiver_subscription_id"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_buddy_challenges_on_challenge_id"
    t.index ["receiver_id"], name: "index_buddy_challenges_on_receiver_id"
    t.index ["receiver_subscription_id"], name: "index_buddy_challenges_on_receiver_subscription_id"
    t.index ["sender_id"], name: "index_buddy_challenges_on_sender_id"
    t.index ["sender_subscription_id"], name: "index_buddy_challenges_on_sender_subscription_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
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

  create_table "earned_badges", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_earned_badges_on_badge_id"
    t.index ["user_id"], name: "index_earned_badges_on_user_id"
  end

  create_table "user_categories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "category_id"
    t.integer "impact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_user_categories_on_category_id"
    t.index ["user_id"], name: "index_user_categories_on_user_id"
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
    t.string "photo"
    t.integer "notification_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "action_categories", "actions"
  add_foreign_key "action_categories", "categories"
  add_foreign_key "action_completions", "challenge_subscriptions"
  add_foreign_key "action_settings", "actions"
  add_foreign_key "action_settings", "challenge_subscriptions"
  add_foreign_key "actions", "challenges"
  add_foreign_key "buddy_challenges", "challenge_subscriptions", column: "receiver_subscription_id"
  add_foreign_key "buddy_challenges", "challenge_subscriptions", column: "sender_subscription_id"
  add_foreign_key "buddy_challenges", "challenges"
  add_foreign_key "buddy_challenges", "users", column: "receiver_id"
  add_foreign_key "buddy_challenges", "users", column: "sender_id"
  add_foreign_key "challenge_subscriptions", "challenges"
  add_foreign_key "challenge_subscriptions", "users"
  add_foreign_key "earned_badges", "badges"
  add_foreign_key "earned_badges", "users"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_categories", "users"
end
