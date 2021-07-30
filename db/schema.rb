# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_27_033421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "token"
    t.string "typeCard"
    t.string "idCard"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.float "amountInCents"
    t.string "currency"
    t.string "customerEmail"
    t.json "paymentMethod"
    t.string "reference"
    t.integer "paymentSourceId"
    t.bigint "travel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travel_id"], name: "index_transactions_on_travel_id"
  end

  create_table "travels", force: :cascade do |t|
    t.point "pointInit"
    t.point "pointFinish"
    t.string "status"
    t.bigint "userRider_id", null: false
    t.bigint "userDriver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "amount"
    t.index ["userDriver_id"], name: "index_travels_on_userDriver_id"
    t.index ["userRider_id"], name: "index_travels_on_userRider_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastName"
    t.string "email", null: false
    t.string "phone"
    t.string "typeUser"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "cards", "users"
  add_foreign_key "transactions", "travels"
  add_foreign_key "travels", "users", column: "userDriver_id"
  add_foreign_key "travels", "users", column: "userRider_id"
end
