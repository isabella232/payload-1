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

ActiveRecord::Schema.define(version: 20161124233513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal  "limit",      default: "0.0", null: false
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.decimal  "balance",    default: "0.0", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "btc_addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_btc_addresses_on_user_id", using: :btree
  end

  create_table "btc_txes", force: :cascade do |t|
    t.integer  "btc_address_id"
    t.decimal  "amount",              precision: 16, scale: 8
    t.integer  "confirmation_status"
    t.string   "coinbase_id"
    t.decimal  "native_amount"
    t.integer  "native_currency"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "trade_id"
    t.index ["btc_address_id"], name: "index_btc_txes_on_btc_address_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "username",                            null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "verification_personals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "dob"
    t.string   "email_primary"
    t.string   "phone_mobile"
    t.string   "phone_secondary"
    t.string   "address_current"
    t.string   "address_permanent"
    t.string   "id_cnic"
    t.boolean  "convicted"
    t.boolean  "terrorist"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "gender",            null: false
    t.index ["user_id"], name: "index_verification_personals_on_user_id", using: :btree
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "btc_addresses", "users"
  add_foreign_key "btc_txes", "btc_addresses"
  add_foreign_key "verification_personals", "users"
end
