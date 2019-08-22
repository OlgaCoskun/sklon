# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_21_131352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "declensions", force: :cascade do |t|
    t.string "dative_fname", comment: "дательный"
    t.string "accusative_fname", comment: "винительный"
    t.string "instrumental_fname", comment: "творительный"
    t.string "prepositional_fname", comment: "предложный"
    t.string "genitive_fname", comment: "родительный"
    t.string "dative_mname", comment: "дательный"
    t.string "accusative_mname", comment: "винительный"
    t.string "instrumental_mname", comment: "творительный"
    t.string "prepositional_mname", comment: "предложный"
    t.string "genitive_mname", comment: "родительный"
    t.string "dative_lname", comment: "дательный"
    t.string "accusative_lname", comment: "винительный"
    t.string "instrumental_lname", comment: "творительный"
    t.string "prepositional_lname", comment: "предложный"
    t.string "genitive_lname", comment: "родительный"
    t.bigint "person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_declensions_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "full_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender"
  end

  add_foreign_key "declensions", "people"
end
