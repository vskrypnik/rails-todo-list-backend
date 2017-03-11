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

ActiveRecord::Schema.define(version: 20170304182611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_projects_on_name", using: :btree
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "todos", force: :cascade do |t|
    t.string   "name",                       null: false
    t.integer  "project_id",                 null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "done",       default: false, null: false
    t.integer  "priority"
    t.date     "deadline"
    t.index ["name"], name: "index_todos_on_name", using: :btree
    t.index ["project_id"], name: "index_todos_on_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "confirmed_at"
    t.string   "unconfirmed_email"
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "projects", "users"
  add_foreign_key "todos", "projects"
end