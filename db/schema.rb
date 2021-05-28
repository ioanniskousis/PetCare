# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_28_061445) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "datetime"
    t.string "title"
    t.text "content"
    t.string "location"
    t.boolean "done"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "lost_photos", force: :cascade do |t|
    t.integer "lost_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lost_id"], name: "index_lost_photos_on_lost_id"
  end

  create_table "losts", force: :cascade do |t|
    t.text "comments", null: false
    t.integer "user_id", null: false
    t.boolean "resolved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_losts_on_user_id"
  end

  create_table "pet_images", force: :cascade do |t|
    t.string "description"
    t.integer "pet_id"
    t.index ["pet_id"], name: "index_pet_images_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "race"
    t.string "breed"
    t.string "color"
    t.date "dateOfBirth"
    t.integer "gender"
    t.boolean "sterilised"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "species_id"
    t.index ["species_id"], name: "index_pets_on_species_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
  end

  create_table "treatment_categories", force: :cascade do |t|
    t.string "categoryName"
    t.integer "parentCategory_id"
    t.integer "order", default: 0
    t.index ["order"], name: "index_treatment_categories_on_order"
    t.index ["parentCategory_id"], name: "index_treatment_categories_on_parentCategory_id"
  end

  create_table "treatment_photos", force: :cascade do |t|
    t.string "description"
    t.integer "treatment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["treatment_id"], name: "index_treatment_photos_on_treatment_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.integer "pet_id"
    t.string "item"
    t.string "description"
    t.float "cost"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.datetime "date"
    t.integer "category_id"
    t.index ["category_id"], name: "index_treatments_on_category_id"
    t.index ["date"], name: "index_treatments_on_date"
    t.index ["pet_id"], name: "index_treatments_on_pet_id"
    t.index ["user_id"], name: "index_treatments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "surname"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["firstname"], name: "index_users_on_firstname"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["surname"], name: "index_users_on_surname"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "users"
  add_foreign_key "losts", "users"
  add_foreign_key "pets", "species"
  add_foreign_key "pets", "users"
  add_foreign_key "treatment_categories", "treatment_categories", column: "parentCategory_id"
  add_foreign_key "treatments", "users"
end
