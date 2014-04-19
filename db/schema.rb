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

ActiveRecord::Schema.define(version: 20140412222934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "votes", force: true do |t|
    t.string   "user"
    t.string   "checkboxes"
    t.text     "story"
    t.boolean  "story_approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "support"
  end

  add_index "votes", ["story_approved"], name: "index_votes_on_story_approved", using: :btree
  add_index "votes", ["support"], name: "index_votes_on_support", using: :btree
  add_index "votes", ["user"], name: "index_votes_on_user", using: :btree

end
