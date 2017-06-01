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

ActiveRecord::Schema.define(version: 20170531220012) do

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.decimal  "amount", precision: 12, scale: 2
    t.datetime "last_execution",
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_donations_on_user_id", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.boolean  "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coaching_activities", force: :cascade do |t|
    t.date     "start_date"
    t.date     "finish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "subject"
    t.text     "message"
    t.boolean  "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilitators", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
