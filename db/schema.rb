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

ActiveRecord::Schema.define(version: 20150315215529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "play_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lines", force: :cascade do |t|
    t.string   "message",    null: false
    t.integer  "speech_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plays", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",                 null: false
    t.integer  "play_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_of_lines"
    t.integer  "longest_speech"
    t.integer  "num_of_scenes"
    t.decimal  "percentage_of_scenes"
  end

  create_table "roles_scenes", id: false, force: :cascade do |t|
    t.integer "role_id",  null: false
    t.integer "scene_id", null: false
  end

  add_index "roles_scenes", ["role_id", "scene_id"], name: "index_roles_scenes_on_role_id_and_scene_id", using: :btree
  add_index "roles_scenes", ["scene_id", "role_id"], name: "index_roles_scenes_on_scene_id_and_role_id", using: :btree

  create_table "scenes", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "act_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speeches", force: :cascade do |t|
    t.integer  "scene_id",   null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
