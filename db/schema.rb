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

ActiveRecord::Schema[8.0].define(version: 2024_12_14_033954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cache", primary_key: "key", id: { type: :string, limit: 191 }, force: :cascade do |t|
    t.text "value", null: false
    t.integer "expiration", null: false
  end

  create_table "cache_locks", primary_key: "key", id: { type: :string, limit: 191 }, force: :cascade do |t|
    t.string "owner", limit: 191, null: false
    t.integer "expiration", null: false
  end

  create_table "failed_jobs", force: :cascade do |t|
    t.string "uuid", limit: 191, null: false
    t.text "connection", null: false
    t.text "queue", null: false
    t.text "payload", null: false
    t.text "exception", null: false
    t.datetime "failed_at", precision: 0, default: -> { "CURRENT_TIMESTAMP" }, null: false

    t.unique_constraint ["uuid"], name: "failed_jobs_uuid_unique"
  end

  create_table "job_batches", id: { type: :string, limit: 191 }, force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.integer "total_jobs", null: false
    t.integer "pending_jobs", null: false
    t.integer "failed_jobs", null: false
    t.text "failed_job_ids", null: false
    t.text "options"
    t.integer "cancelled_at"
    t.integer "created_at", null: false
    t.integer "finished_at"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "queue", limit: 191, null: false
    t.text "payload", null: false
    t.integer "attempts", limit: 2, null: false
    t.integer "reserved_at"
    t.integer "available_at", null: false
    t.integer "created_at", null: false
    t.index ["queue"], name: "jobs_queue_index"
  end

  create_table "migrations", id: :serial, force: :cascade do |t|
    t.string "migration", limit: 191, null: false
    t.integer "batch", null: false
  end

  create_table "password_reset_tokens", primary_key: "email", id: { type: :string, limit: 191 }, force: :cascade do |t|
    t.string "token", limit: 191, null: false
    t.datetime "created_at", precision: 0
  end

  create_table "personal_access_tokens", force: :cascade do |t|
    t.string "tokenable_type", limit: 191, null: false
    t.bigint "tokenable_id", null: false
    t.string "name", limit: 191, null: false
    t.string "token", limit: 64, null: false
    t.text "abilities"
    t.datetime "last_used_at", precision: 0
    t.datetime "expires_at", precision: 0
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
    t.index ["tokenable_type", "tokenable_id"], name: "personal_access_tokens_tokenable_type_tokenable_id_index"
    t.unique_constraint ["token"], name: "personal_access_tokens_token_unique"
  end

  create_table "sessions", id: { type: :string, limit: 191 }, force: :cascade do |t|
    t.bigint "user_id"
    t.string "ip_address", limit: 45
    t.text "user_agent"
    t.text "payload", null: false
    t.integer "last_activity", null: false
    t.index ["last_activity"], name: "sessions_last_activity_index"
    t.index ["user_id"], name: "sessions_user_id_index"
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasksi", id: :integer, default: -> { "nextval('tasks_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.text "description", null: false
    t.date "date", null: false
    t.string "location", limit: 255, null: false
    t.string "responsible", limit: 255, null: false
    t.string "status", limit: 255, default: "pendiente", null: false
    t.integer "likes", default: 0, null: false
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.string "email", limit: 191, null: false
    t.datetime "email_verified_at", precision: 0
    t.string "password", limit: 191, null: false
    t.string "remember_token", limit: 100
    t.datetime "created_at", precision: 0
    t.datetime "updated_at", precision: 0

    t.unique_constraint ["email"], name: "users_email_unique"
  end
end
