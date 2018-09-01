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

ActiveRecord::Schema.define(version: 2018_09_01_173556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coupom_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupoms", force: :cascade do |t|
    t.string "value"
    t.string "key"
    t.date "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.bigint "coupom_type_id"
    t.boolean "used", default: false
    t.boolean "is_automatic", default: false
    t.index ["coupom_type_id"], name: "index_coupoms_on_coupom_type_id"
    t.index ["event_id"], name: "index_coupoms_on_event_id"
  end

  create_table "event_item_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_items", force: :cascade do |t|
    t.bigint "event_id"
    t.string "name"
    t.text "description"
    t.decimal "value"
    t.bigint "event_item_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.boolean "permit_concomitance", default: true
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean "is_required", default: false
    t.index ["event_id"], name: "index_event_items_on_event_id"
    t.index ["event_item_type_id"], name: "index_event_items_on_event_item_type_id"
    t.index ["location_id"], name: "index_event_items_on_location_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "event_type_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.boolean "is_principal", default: true
    t.bigint "location_id"
    t.boolean "is_direct_inscription", default: false
    t.decimal "value"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.index ["event_id"], name: "index_events_on_event_id"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
    t.index ["location_id"], name: "index_events_on_location_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "inscription_items", force: :cascade do |t|
    t.bigint "inscription_id"
    t.decimal "value"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_item_id"
    t.index ["event_item_id"], name: "index_inscription_items_on_event_item_id"
    t.index ["inscription_id"], name: "index_inscription_items_on_inscription_id"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.boolean "paid"
    t.bigint "event_id"
    t.bigint "user_id"
    t.bigint "coupom_id"
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupom_id"], name: "index_inscriptions_on_coupom_id"
    t.index ["event_id"], name: "index_inscriptions_on_event_id"
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "attr_name"
    t.string "attr_value"
    t.bigint "responsible_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responsible_id"], name: "index_items_on_responsible_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_locations_on_location_id"
  end

  create_table "moderators", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_moderators_on_event_id"
    t.index ["user_id"], name: "index_moderators_on_user_id"
  end

  create_table "partnerships", force: :cascade do |t|
    t.string "name"
    t.bigint "event_id"
    t.bigint "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_partnerships_on_event_id"
    t.index ["institution_id"], name: "index_partnerships_on_institution_id"
  end

  create_table "responsibility_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsibles", force: :cascade do |t|
    t.string "name"
    t.bigint "event_item_id"
    t.text "description"
    t.bigint "responsibility_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_item_id"], name: "index_responsibles_on_event_item_id"
    t.index ["responsibility_type_id"], name: "index_responsibles_on_responsibility_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "stages", force: :cascade do |t|
    t.bigint "event_id"
    t.string "name"
    t.text "description"
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_stages_on_event_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "coupoms", "coupom_types"
  add_foreign_key "coupoms", "events"
  add_foreign_key "event_items", "event_item_types"
  add_foreign_key "event_items", "events"
  add_foreign_key "event_items", "locations"
  add_foreign_key "events", "event_types"
  add_foreign_key "events", "events"
  add_foreign_key "events", "locations"
  add_foreign_key "events", "users"
  add_foreign_key "inscription_items", "event_items"
  add_foreign_key "inscription_items", "inscriptions"
  add_foreign_key "inscriptions", "coupoms"
  add_foreign_key "inscriptions", "events"
  add_foreign_key "inscriptions", "users"
  add_foreign_key "items", "responsibles"
  add_foreign_key "locations", "locations"
  add_foreign_key "moderators", "events"
  add_foreign_key "moderators", "users"
  add_foreign_key "partnerships", "events"
  add_foreign_key "partnerships", "institutions"
  add_foreign_key "responsibles", "event_items"
  add_foreign_key "responsibles", "responsibility_types"
  add_foreign_key "stages", "events"
end
