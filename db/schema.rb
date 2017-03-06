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

ActiveRecord::Schema.define(version: 20170306141825) do

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

  create_table "fixtures", force: :cascade do |t|
    t.integer  "team_one_id"
    t.integer  "team_two_id"
    t.integer  "tournament_phase_id"
    t.integer  "points_team_one"
    t.integer  "points_team_two"
    t.integer  "time_left"
    t.boolean  "active"
    t.string   "state"
    t.text     "comment"
    t.boolean  "emailed",             default: false
    t.boolean  "facebooked",          default: false
    t.boolean  "twitted",             default: false
    t.boolean  "notified",            default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "fixtures", ["team_one_id"], name: "index_fixtures_on_team_one_id", using: :btree
  add_index "fixtures", ["team_two_id"], name: "index_fixtures_on_team_two_id", using: :btree
  add_index "fixtures", ["tournament_phase_id"], name: "index_fixtures_on_tournament_phase_id", using: :btree

  create_table "gears", force: :cascade do |t|
    t.string   "category",        null: false
    t.string   "name",            null: false
    t.integer  "year"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "gears", ["manufacturer_id"], name: "index_gears_on_manufacturer_id", using: :btree

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string   "name",                          null: false
    t.boolean  "is_fixture",    default: false
    t.string   "description"
    t.integer  "tournament_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "phases", ["id"], name: "index_phases_on_id", using: :btree
  add_index "phases", ["tournament_id"], name: "index_phases_on_tournament_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.string   "dob"
    t.string   "nationality"
    t.string   "position"
    t.string   "logo"
    t.string   "passport"
    t.integer  "age"
    t.boolean  "captain"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "teams", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "logo"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "country",                      null: false
    t.string   "locale",        default: "es"
    t.integer  "category_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "teams", ["category_id"], name: "index_teams_on_category_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "token",                     null: false
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_category_team_standings", force: :cascade do |t|
    t.integer  "wins",          null: false
    t.integer  "losts",         null: false
    t.integer  "ties",          null: false
    t.integer  "year",          null: false
    t.integer  "position",      null: false
    t.integer  "tournament_id"
    t.integer  "category_id"
    t.integer  "team_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tournament_category_team_standings", ["category_id"], name: "index_tournament_category_team_standings_on_category_id", using: :btree
  add_index "tournament_category_team_standings", ["team_id"], name: "index_tournament_category_team_standings_on_team_id", using: :btree
  add_index "tournament_category_team_standings", ["tournament_id"], name: "index_tournament_category_team_standings_on_tournament_id", using: :btree

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

  create_table "tournament_phases", force: :cascade do |t|
    t.boolean  "active",              default: true
    t.integer  "category_id"
    t.integer  "phase_id"
    t.integer  "tournament_id"
    t.integer  "tournament_dates_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "tournament_phases", ["category_id"], name: "index_tournament_phases_on_category_id", using: :btree
  add_index "tournament_phases", ["phase_id"], name: "index_tournament_phases_on_phase_id", using: :btree
  add_index "tournament_phases", ["tournament_dates_id"], name: "index_tournament_phases_on_tournament_dates_id", using: :btree
  add_index "tournament_phases", ["tournament_id"], name: "index_tournament_phases_on_tournament_id", using: :btree

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
