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

ActiveRecord::Schema.define(version: 2020_03_27_073622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_table "cartons", force: :cascade do |t|
    t.string "matiere"
    t.string "annee"
    t.string "localisation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sensible"
    t.string "chrono"
    t.integer "user_id"
  end

  create_table "dossiers", force: :cascade do |t|
    t.string "client"
    t.bigint "carton_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sujet"
    t.boolean "sensible"
    t.index ["carton_id"], name: "index_dossiers_on_carton_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "prenom", default: "", null: false
    t.string "nom_de_famille", default: "", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dossiers", "cartons"
end
