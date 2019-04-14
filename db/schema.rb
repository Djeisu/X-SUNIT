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

ActiveRecord::Schema.define(version: 2019_04_14_012656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "log_locations", force: :cascade do |t|
    t.bigint "survivor_id"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at"
    t.index ["survivor_id"], name: "index_log_locations_on_survivor_id"
  end

  create_table "report_abducteds", force: :cascade do |t|
    t.bigint "survivor_report_id"
    t.bigint "survivor_abducted_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survivor_abducted_id"], name: "index_report_abducteds_on_survivor_abducted_id"
    t.index ["survivor_report_id"], name: "index_report_abducteds_on_survivor_report_id"
  end

  create_table "survivors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.boolean "abducted"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "log_locations", "survivors", on_delete: :cascade
  add_foreign_key "report_abducteds", "survivors", column: "survivor_abducted_id"
  add_foreign_key "report_abducteds", "survivors", column: "survivor_report_id"
  create_trigger("report_abducteds_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("report_abducteds").
      after(:insert) do
    <<-SQL_ACTIONS
UPDATE survivors s SET abducted = true WHERE s.id IN
    (SELECT ra.survivor_abducted_id AS survivor_id
    FROM report_abducteds ra 
    WHERE ( SELECT count(rea.survivor_abducted_id) 
      FROM report_abducteds rea 
      WHERE ra.survivor_abducted_id = rea.survivor_abducted_id ) >= 3 
    GROUP BY ra.survivor_abducted_id);
    SQL_ACTIONS
  end

  create_trigger("survivors_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("survivors").
      after(:insert) do
    "INSERT INTO log_locations(survivor_id, latitude, longitude, created_at) VALUES (NEW.id, NEW.latitude, NEW.longitude, NEW.updated_at);"
  end

  create_trigger("survivors_after_update_row_tr", :generated => true, :compatibility => 1).
      on("survivors").
      after(:update) do |t|
    t.of(:latitude, :longitude) do
      "INSERT INTO log_locations(survivor_id, latitude, longitude, created_at) VALUES (NEW.id, NEW.latitude, NEW.longitude, NEW.updated_at);"
    end
  end

end
