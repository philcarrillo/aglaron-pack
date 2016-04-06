# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160405134807) do

  create_table "contacts", force: :cascade do |t|
    t.string   "company",        limit: 50
    t.string   "contact_method", limit: 25
    t.string   "help_required",  limit: 25
    t.string   "email",          limit: 255
    t.string   "name_first",     limit: 60
    t.string   "name_last",      limit: 60
    t.string   "phone",          limit: 20
    t.string   "title",          limit: 30
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "info_requests", force: :cascade do |t|
    t.text     "comment"
    t.string   "company",        limit: 50
    t.integer  "contact_id"
    t.string   "contact_method", limit: 25
    t.string   "help_required",  limit: 25
    t.string   "email",          limit: 255
    t.string   "name_first",     limit: 60
    t.string   "name_last",      limit: 60
    t.string   "phone",          limit: 20
    t.string   "title",          limit: 30
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "pings", force: :cascade do |t|
    t.text     "msg",        limit: 100
    t.text     "msg_type",   limit: 20
    t.integer  "mod_count",              default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
