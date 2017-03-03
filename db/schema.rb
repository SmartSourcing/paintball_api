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

ActiveRecord::Schema.define(version: 20170302181533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",                       null: false
    t.text     "description"
    t.boolean  "active",      default: true
    t.integer  "minutes_to"
    t.integer  "career_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "logo",                          null: false
    t.string   "web_link"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.boolean  "home_sponsor",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors_tournament_dates", id: false, force: :cascade do |t|
    t.integer "sponsor_id",         null: false
    t.integer "tournament_date_id", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "token",                     null: false
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_dates", force: :cascade do |t|
    t.text     "description",                      null: false
    t.boolean  "active",           default: false
    t.datetime "started_at",                       null: false
    t.datetime "finished_at",                      null: false
    t.datetime "close_draw_at",                    null: false
    t.string   "contact",                          null: false
    t.string   "place"
    t.string   "link_to_facebook"
    t.string   "link_to_twitter"
    t.integer  "tournament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tournament_dates", ["tournament_id"], name: "index_tournament_dates_on_tournament_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "nickname",                       null: false
    t.datetime "started_at",                     null: false
    t.datetime "finished_at",                    null: false
    t.string   "tournament_type",                null: false
    t.string   "country",                        null: false
    t.string   "logo",                           null: false
    t.boolean  "active",          default: true
    t.string   "hashtag_cloud"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "web_site"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "tournaments", ["id"], name: "index_tournaments_on_id", using: :btree

end
