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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150227190642) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.string   "resource_id",    :null => false
    t.string   "resource_type",  :null => false
    t.integer  "author_user_id"
    t.text     "body"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "active_admin_comments", ["author_user_id"], :name => "index_active_admin_comments_on_author_user_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "beta_signups", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "beta_signups", ["user_id"], :name => "index_beta_signups_on_user_id"

  create_table "event_registrations", :force => true do |t|
    t.integer  "event_id",   :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_registrations", ["event_id"], :name => "index_event_registrations_on_event_id"
  add_index "event_registrations", ["user_id"], :name => "index_event_registrations_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "short_code",                           :null => false
    t.string   "name",                                 :null => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "chat_url"
    t.string   "map_url"
    t.string   "schedule_url"
    t.string   "hashtag"
    t.string   "slug"
    t.string   "eventbrite_url"
    t.string   "teaser"
    t.string   "lead_organizer"
    t.string   "lead_email"
    t.string   "organizer"
    t.string   "organizer_email"
    t.string   "location"
    t.boolean  "is_public",         :default => false, :null => false
    t.text     "schedule"
  end

  add_index "events", ["short_code"], :name => "index_events_on_short_code", :unique => true
  add_index "events", ["slug"], :name => "index_events_on_slug", :unique => true

  create_table "favorite_projects", :force => true do |t|
    t.integer  "project_id",                    :null => false
    t.integer  "user_id",                       :null => false
    t.boolean  "removed",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "favorite_projects", ["project_id"], :name => "index_favorite_projects_on_project_id"
  add_index "favorite_projects", ["user_id", "project_id"], :name => "index_favorite_projects_on_user_id_and_project_id", :unique => true
  add_index "favorite_projects", ["user_id"], :name => "index_favorite_projects_on_user_id"

  create_table "featured_projects", :force => true do |t|
    t.integer  "project_id", :null => false
    t.integer  "event_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "featured_projects", ["event_id"], :name => "index_featured_projects_on_event_id"
  add_index "featured_projects", ["project_id", "event_id"], :name => "index_featured_projects_on_project_id_and_event_id", :unique => true
  add_index "featured_projects", ["project_id"], :name => "index_featured_projects_on_project_id"

  create_table "jobs", :force => true do |t|
    t.integer  "organization_id",               :null => false
    t.string   "title",           :limit => 50, :null => false
    t.text     "overview"
    t.string   "apply_url"
    t.datetime "expires_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "jobs", ["expires_at"], :name => "index_jobs_on_expires_at"
  add_index "jobs", ["organization_id"], :name => "index_jobs_on_organization_id"

  create_table "organization_metrics", :force => true do |t|
    t.integer  "organization_id", :null => false
    t.string   "metric_value",    :null => false
    t.string   "metric_label",    :null => false
    t.text     "metric_footnote"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name",                                               :null => false
    t.string   "url"
    t.string   "github_org"
    t.text     "description"
    t.boolean  "is_tax_exempt",                   :default => false, :null => false
    t.string   "contact_name"
    t.string   "contact_role"
    t.string   "contact_email"
    t.integer  "annual_budget_usd"
    t.integer  "total_staff_size"
    t.integer  "tech_staff_size"
    t.text     "notes"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "image_url"
    t.string   "twitter",           :limit => 15
    t.string   "slug"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "organizations", ["slug"], :name => "index_organizations_on_slug", :unique => true

  create_table "projects", :force => true do |t|
    t.integer  "organization_id",                                  :null => false
    t.string   "name",                                             :null => false
    t.string   "github_repo"
    t.string   "description"
    t.text     "notes"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.boolean  "is_active",                     :default => true,  :null => false
    t.string   "slug"
    t.boolean  "is_approved",                   :default => false, :null => false
    t.string   "url"
    t.string   "install_url"
    t.string   "help_url"
    t.string   "twitter",         :limit => 15
  end

  add_index "projects", ["slug"], :name => "index_projects_on_slug", :unique => true

  create_table "services", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.string   "uname"
    t.string   "uemail"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ulogin"
  end

  create_table "sponsorships", :force => true do |t|
    t.integer  "organization_id",                :null => false
    t.integer  "tier",                           :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "event_id",        :default => 1, :null => false
  end

  add_index "sponsorships", ["organization_id"], :name => "index_sponsorships_on_organization_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], :name => "taggings_idx", :unique => true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "taggings_count", :default => 0
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id",                            :null => false
    t.string   "name"
    t.string   "headline"
    t.string   "gravatar_email"
    t.boolean  "is_coder",        :default => false, :null => false
    t.boolean  "represents_org",  :default => false, :null => false
    t.boolean  "represents_team", :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "email_news",      :default => true,  :null => false
    t.boolean  "email_training",  :default => true,  :null => false
  end

  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "password_hash",          :default => "",    :null => false
    t.string   "password_salt",          :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "is_admin",               :default => false, :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
