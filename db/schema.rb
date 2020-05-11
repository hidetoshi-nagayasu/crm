# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_07_031706) do

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "phone_number", limit: 20
    t.string "mobile_number", limit: 20
    t.string "email"
    t.integer "age", limit: 1
    t.string "zip_code", limit: 8
    t.integer "prefecture_code", limit: 1
    t.string "city"
    t.string "street"
    t.string "building"
    t.boolean "is_deleted", default: false, null: false
    t.bigint "created_by", null: false
    t.bigint "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gender", limit: 1
  end

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "is_deleted", default: false, null: false
    t.bigint "created_by", null: false
    t.bigint "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.date "birthday"
    t.boolean "has_spouse"
    t.string "zip_code", limit: 8
    t.integer "prefecture_code", limit: 1
    t.string "city"
    t.string "street"
    t.string "building"
    t.string "phone_number", limit: 20
    t.string "mobile_number", limit: 20
    t.bigint "department_id", null: false
    t.boolean "is_deleted", default: false, null: false
    t.bigint "created_by", null: false
    t.bigint "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "order_employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "employee_id", null: false
    t.boolean "is_deleted", default: false, null: false
    t.bigint "created_by", null: false
    t.bigint "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_order_employees_on_employee_id"
    t.index ["order_id"], name: "index_order_employees_on_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "sales", null: false
    t.bigint "customer_id", null: false
    t.bigint "status_id", null: false
    t.date "start_date"
    t.date "delivery_date"
    t.boolean "is_deleted", default: false, null: false
    t.bigint "created_by", null: false
    t.bigint "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["status_id"], name: "index_orders_on_status_id"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_deleted", default: false, null: false
    t.bigint "created_by", null: false
    t.bigint "updated_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "employees", "departments"
  add_foreign_key "order_employees", "employees"
  add_foreign_key "order_employees", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "statuses"
end
