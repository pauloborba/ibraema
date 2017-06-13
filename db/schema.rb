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


ActiveRecord::Schema.define(version: 20170608131718) do

  create_table "coaching_activities", force: :cascade do |t|
    t.datetime "date_start"
    t.datetime "date_finish"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["institution_id"], name: "index_coaching_activities_on_institution_id"
  end

  create_table "coaching_activities_facilitators", id: false, force: :cascade do |t|
    t.integer "coaching_activity_id"
    t.integer "facilitator_id"
    t.index ["coaching_activity_id"], name: "index_coaching_activities_facilitators_on_coaching_activity_id"
    t.index ["facilitator_id"], name: "index_coaching_activities_facilitators_on_facilitator_id"
  end

  create_table "donations", force: :cascade do |t|
    t.decimal  "amount",        precision: 12, scale: 2
    t.datetime "donation_date"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string   "subject"
    t.text     "message"
    t.boolean  "mark"
    t.integer  "resent",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end


  create_table "facilitators", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["institution_id"], name: "index_facilitators_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "users", force: :cascade do |t|
    t.string   "identifier"
    t.string   "email"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
