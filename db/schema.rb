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

ActiveRecord::Schema.define(version: 20170120024047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stat_id"], name: "index_friends_on_stat_id", using: :btree
    t.index ["user_id"], name: "index_friends_on_user_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "stats", force: :cascade do |t|
    t.string   "course"
    t.date     "date"
    t.integer  "score"
    t.integer  "penalties"
    t.integer  "up_down"
    t.integer  "sand_attempt"
    t.integer  "sand_save"
    t.float    "holed_putt_length"
    t.integer  "hole1_par"
    t.integer  "hole2_par"
    t.integer  "hole3_par"
    t.integer  "hole4_par"
    t.integer  "hole5_par"
    t.integer  "hole6_par"
    t.integer  "hole7_par"
    t.integer  "hole8_par"
    t.integer  "hole9_par"
    t.integer  "hole10_par"
    t.integer  "hole11_par"
    t.integer  "hole12_par"
    t.integer  "hole13_par"
    t.integer  "hole14_par"
    t.integer  "hole15_par"
    t.integer  "hole16_par"
    t.integer  "hole17_par"
    t.integer  "hole18_par"
    t.integer  "hole1_score"
    t.integer  "hole2_score"
    t.integer  "hole3_score"
    t.integer  "hole4_score"
    t.integer  "hole5_score"
    t.integer  "hole6_score"
    t.integer  "hole7_score"
    t.integer  "hole8_score"
    t.integer  "hole9_score"
    t.integer  "hole10_score"
    t.integer  "hole11_score"
    t.integer  "hole12_score"
    t.integer  "hole13_score"
    t.integer  "hole14_score"
    t.integer  "hole15_score"
    t.integer  "hole16_score"
    t.integer  "hole17_score"
    t.integer  "hole18_score"
    t.string   "hole1_fway"
    t.string   "hole2_fway"
    t.string   "hole3_fway"
    t.string   "hole4_fway"
    t.string   "hole5_fway"
    t.string   "hole6_fway"
    t.string   "hole7_fway"
    t.string   "hole8_fway"
    t.string   "hole9_fway"
    t.string   "hole10_fway"
    t.string   "hole11_fway"
    t.string   "hole12_fway"
    t.string   "hole13_fway"
    t.string   "hole14_fway"
    t.string   "hole15_fway"
    t.string   "hole16_fway"
    t.string   "hole17_fway"
    t.string   "hole18_fway"
    t.string   "hole1_gir"
    t.string   "hole2_gir"
    t.string   "hole3_gir"
    t.string   "hole4_gir"
    t.string   "hole5_gir"
    t.string   "hole6_gir"
    t.string   "hole7_gir"
    t.string   "hole8_gir"
    t.string   "hole9_gir"
    t.string   "hole10_gir"
    t.string   "hole11_gir"
    t.string   "hole12_gir"
    t.string   "hole13_gir"
    t.string   "hole14_gir"
    t.string   "hole15_gir"
    t.string   "hole16_gir"
    t.string   "hole17_gir"
    t.string   "hole18_gir"
    t.integer  "hole1_putts"
    t.integer  "hole2_putts"
    t.integer  "hole3_putts"
    t.integer  "hole4_putts"
    t.integer  "hole5_putts"
    t.integer  "hole6_putts"
    t.integer  "hole7_putts"
    t.integer  "hole8_putts"
    t.integer  "hole9_putts"
    t.integer  "hole10_putts"
    t.integer  "hole11_putts"
    t.integer  "hole12_putts"
    t.integer  "hole13_putts"
    t.integer  "hole14_putts"
    t.integer  "hole15_putts"
    t.integer  "hole16_putts"
    t.integer  "hole17_putts"
    t.integer  "hole18_putts"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_stats_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "friends", "stats"
  add_foreign_key "friends", "users"
  add_foreign_key "stats", "users"
end
