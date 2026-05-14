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

ActiveRecord::Schema[8.1].define(version: 2026_05_14_150000) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.integer "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.integer "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "lean_cms_form_submissions", force: :cascade do |t|
    t.json "additional_data"
    t.string "city"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "form_type", null: false
    t.string "ip_address"
    t.text "message"
    t.string "name"
    t.string "phone"
    t.string "state"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.string "zip"
    t.index ["created_at"], name: "index_lean_cms_form_submissions_on_created_at"
    t.index ["form_type"], name: "index_lean_cms_form_submissions_on_form_type"
    t.index ["status"], name: "index_lean_cms_form_submissions_on_status"
  end

  create_table "lean_cms_magic_links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "created_by_ip"
    t.datetime "expires_at", null: false
    t.string "purpose", null: false
    t.string "token", null: false
    t.datetime "updated_at", null: false
    t.datetime "used_at"
    t.string "used_from_ip"
    t.integer "user_id", null: false
    t.index ["expires_at"], name: "index_lean_cms_magic_links_on_expires_at"
    t.index ["token"], name: "index_lean_cms_magic_links_on_token", unique: true
    t.index ["user_id", "purpose"], name: "index_lean_cms_magic_links_on_user_id_and_purpose"
    t.index ["user_id"], name: "index_lean_cms_magic_links_on_user_id"
  end

  create_table "lean_cms_meta_tags", force: :cascade do |t|
    t.string "canonical_url"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "og_image_url"
    t.json "structured_data"
    t.integer "taggable_id", null: false
    t.string "taggable_type", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["taggable_type", "taggable_id"], name: "index_lean_cms_meta_tags_on_taggable"
    t.index ["taggable_type", "taggable_id"], name: "index_lean_cms_meta_tags_on_taggable_type_and_taggable_id"
  end

  create_table "lean_cms_notification_settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "email_enabled", default: false
    t.string "email_provider"
    t.boolean "in_app_enabled", default: true
    t.text "mailgun_api_key"
    t.string "mailgun_domain"
    t.text "notification_emails"
    t.text "notification_phones"
    t.text "sendgrid_api_key"
    t.boolean "sms_enabled", default: false
    t.text "twilio_account_sid"
    t.text "twilio_auth_token"
    t.string "twilio_from_number"
    t.datetime "updated_at", null: false
  end

  create_table "lean_cms_page_contents", force: :cascade do |t|
    t.text "content"
    t.integer "content_type", default: 0
    t.datetime "created_at", null: false
    t.string "display_title"
    t.string "key", null: false
    t.string "label"
    t.integer "last_edited_by_id", null: false
    t.json "options"
    t.string "page", null: false
    t.string "page_display_title"
    t.integer "page_id"
    t.integer "page_order", default: 0
    t.integer "position", default: 0
    t.string "section", null: false
    t.integer "section_order", default: 0
    t.datetime "updated_at", null: false
    t.text "value"
    t.index ["last_edited_by_id"], name: "index_lean_cms_page_contents_on_last_edited_by_id"
    t.index ["page", "section", "key"], name: "index_page_contents_on_page_section_key", unique: true
    t.index ["page", "section"], name: "index_page_contents_on_page_and_section"
    t.index ["page_id"], name: "index_lean_cms_page_contents_on_page_id"
    t.index ["page_order", "section_order", "position"], name: "idx_on_page_order_section_order_position_688bd93d30"
  end

  create_table "lean_cms_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "meta_description"
    t.string "meta_title"
    t.string "parent_slug"
    t.integer "position", default: 0
    t.boolean "published", default: false, null: false
    t.string "slug", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["slug", "parent_slug"], name: "index_lean_cms_pages_on_slug_and_parent_slug", unique: true
  end

  create_table "lean_cms_posts", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "content_type", default: 0, null: false
    t.datetime "created_at", null: false
    t.text "excerpt"
    t.integer "last_edited_by_id"
    t.datetime "published_at"
    t.string "slug", null: false
    t.integer "status", default: 0, null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_lean_cms_posts_on_author_id"
    t.index ["content_type"], name: "index_lean_cms_posts_on_content_type"
    t.index ["last_edited_by_id"], name: "index_lean_cms_posts_on_last_edited_by_id"
    t.index ["slug"], name: "index_lean_cms_posts_on_slug", unique: true
    t.index ["status", "published_at"], name: "index_lean_cms_posts_on_status_and_published_at"
  end

  create_table "lean_cms_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_lean_cms_sessions_on_user_id"
  end

  create_table "lean_cms_settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "key", null: false
    t.datetime "updated_at", null: false
    t.text "value"
    t.index ["key"], name: "index_lean_cms_settings_on_key", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "solid_queue_blocked_executions", force: :cascade do |t|
    t.string "concurrency_key", null: false
    t.datetime "created_at", null: false
    t.datetime "expires_at", null: false
    t.bigint "job_id", null: false
    t.integer "priority", default: 0, null: false
    t.string "queue_name", null: false
    t.index ["concurrency_key", "priority", "job_id"], name: "index_solid_queue_blocked_executions_for_release"
    t.index ["expires_at", "concurrency_key"], name: "index_solid_queue_blocked_executions_for_maintenance"
    t.index ["job_id"], name: "index_solid_queue_blocked_executions_on_job_id", unique: true
  end

  create_table "solid_queue_claimed_executions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "job_id", null: false
    t.bigint "process_id"
    t.index ["job_id"], name: "index_solid_queue_claimed_executions_on_job_id", unique: true
    t.index ["process_id", "job_id"], name: "index_solid_queue_claimed_executions_on_process_id_and_job_id"
  end

  create_table "solid_queue_failed_executions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "error"
    t.bigint "job_id", null: false
    t.index ["job_id"], name: "index_solid_queue_failed_executions_on_job_id", unique: true
  end

  create_table "solid_queue_jobs", force: :cascade do |t|
    t.string "active_job_id"
    t.text "arguments"
    t.string "class_name", null: false
    t.string "concurrency_key"
    t.datetime "created_at", null: false
    t.datetime "finished_at"
    t.integer "priority", default: 0, null: false
    t.string "queue_name", null: false
    t.datetime "scheduled_at"
    t.datetime "updated_at", null: false
    t.index ["active_job_id"], name: "index_solid_queue_jobs_on_active_job_id"
    t.index ["class_name"], name: "index_solid_queue_jobs_on_class_name"
    t.index ["finished_at"], name: "index_solid_queue_jobs_on_finished_at"
    t.index ["queue_name", "finished_at"], name: "index_solid_queue_jobs_for_filtering"
    t.index ["scheduled_at", "finished_at"], name: "index_solid_queue_jobs_for_alerting"
  end

  create_table "solid_queue_pauses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "queue_name", null: false
    t.index ["queue_name"], name: "index_solid_queue_pauses_on_queue_name", unique: true
  end

  create_table "solid_queue_processes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "hostname"
    t.string "kind", null: false
    t.datetime "last_heartbeat_at", null: false
    t.text "metadata"
    t.string "name", null: false
    t.integer "pid", null: false
    t.bigint "supervisor_id"
    t.index ["last_heartbeat_at"], name: "index_solid_queue_processes_on_last_heartbeat_at"
    t.index ["name", "supervisor_id"], name: "index_solid_queue_processes_on_name_and_supervisor_id", unique: true
    t.index ["supervisor_id"], name: "index_solid_queue_processes_on_supervisor_id"
  end

  create_table "solid_queue_ready_executions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "job_id", null: false
    t.integer "priority", default: 0, null: false
    t.string "queue_name", null: false
    t.index ["job_id"], name: "index_solid_queue_ready_executions_on_job_id", unique: true
    t.index ["priority", "job_id"], name: "index_solid_queue_poll_all"
    t.index ["queue_name", "priority", "job_id"], name: "index_solid_queue_poll_by_queue"
  end

  create_table "solid_queue_recurring_executions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "job_id", null: false
    t.datetime "run_at", null: false
    t.string "task_key", null: false
    t.index ["job_id"], name: "index_solid_queue_recurring_executions_on_job_id", unique: true
    t.index ["task_key", "run_at"], name: "index_solid_queue_recurring_executions_on_task_key_and_run_at", unique: true
  end

  create_table "solid_queue_recurring_tasks", force: :cascade do |t|
    t.text "arguments"
    t.string "class_name"
    t.string "command", limit: 2048
    t.datetime "created_at", null: false
    t.text "description"
    t.string "key", null: false
    t.integer "priority", default: 0
    t.string "queue_name"
    t.string "schedule", null: false
    t.boolean "static", default: true, null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_solid_queue_recurring_tasks_on_key", unique: true
    t.index ["static"], name: "index_solid_queue_recurring_tasks_on_static"
  end

  create_table "solid_queue_scheduled_executions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "job_id", null: false
    t.integer "priority", default: 0, null: false
    t.string "queue_name", null: false
    t.datetime "scheduled_at", null: false
    t.index ["job_id"], name: "index_solid_queue_scheduled_executions_on_job_id", unique: true
    t.index ["scheduled_at", "priority", "job_id"], name: "index_solid_queue_dispatch_all"
  end

  create_table "solid_queue_semaphores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "expires_at", null: false
    t.string "key", null: false
    t.datetime "updated_at", null: false
    t.integer "value", default: 1, null: false
    t.index ["expires_at"], name: "index_solid_queue_semaphores_on_expires_at"
    t.index ["key", "value"], name: "index_solid_queue_semaphores_on_key_and_value"
    t.index ["key"], name: "index_solid_queue_semaphores_on_key", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.boolean "can_access_settings", default: false, null: false
    t.boolean "can_edit_blog", default: false, null: false
    t.boolean "can_edit_pages", default: false, null: false
    t.boolean "can_manage_users", default: false, null: false
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.boolean "is_super_admin", default: false, null: false
    t.datetime "last_login_at"
    t.boolean "must_change_password", default: false, null: false
    t.string "name"
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.datetime "created_at"
    t.string "event", null: false
    t.bigint "item_id", null: false
    t.string "item_type", null: false
    t.text "object"
    t.string "whodunnit"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "lean_cms_page_contents", "lean_cms_pages", column: "page_id"
  add_foreign_key "sessions", "users"
  add_foreign_key "solid_queue_blocked_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_claimed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_failed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_ready_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_recurring_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_scheduled_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
end
