# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090812110010) do

  create_table "article_categories", :force => true do |t|
    t.string "name",        :default => "", :null => false
    t.string "description"
  end

  add_index "article_categories", ["name"], :name => "index_article_categories_on_name", :unique => true

  create_table "article_prices", :force => true do |t|
    t.integer  "article_id"
    t.decimal  "price",         :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax",           :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "deposit",       :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "unit_quantity"
    t.datetime "created_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "name",                                              :default => "",   :null => false
    t.integer  "supplier_id",                                       :default => 0,    :null => false
    t.integer  "article_category_id",                               :default => 0,    :null => false
    t.string   "unit",                                              :default => "",   :null => false
    t.string   "note"
    t.boolean  "availability",                                      :default => true, :null => false
    t.string   "manufacturer"
    t.string   "origin"
    t.datetime "shared_updated_on"
    t.decimal  "price",               :precision => 8, :scale => 2
    t.float    "tax"
    t.decimal  "deposit",             :precision => 8, :scale => 2, :default => 0.0
    t.integer  "unit_quantity",                                     :default => 1,    :null => false
    t.string   "order_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "type"
    t.integer  "quantity",                                          :default => 0
  end

  add_index "articles", ["name", "supplier_id"], :name => "index_articles_on_name_and_supplier_id"

  create_table "assignments", :force => true do |t|
    t.integer "user_id",  :default => 0,     :null => false
    t.integer "task_id",  :default => 0,     :null => false
    t.boolean "accepted", :default => false
  end

  add_index "assignments", ["user_id", "task_id"], :name => "index_assignments_on_user_id_and_task_id", :unique => true

  create_table "configurable_settings", :force => true do |t|
    t.integer "configurable_id"
    t.string  "configurable_type"
    t.integer "targetable_id"
    t.string  "targetable_type"
    t.string  "name",              :default => "", :null => false
    t.string  "value_type"
    t.text    "value"
  end

  add_index "configurable_settings", ["name"], :name => "index_configurable_settings_on_name"

  create_table "deliveries", :force => true do |t|
    t.integer  "supplier_id"
    t.date     "delivered_on"
    t.datetime "created_at"
    t.text     "note"
  end

  create_table "financial_transactions", :force => true do |t|
    t.integer  "ordergroup_id",                               :default => 0,   :null => false
    t.decimal  "amount",        :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.text     "note",                                                         :null => false
    t.integer  "user_id",                                     :default => 0,   :null => false
    t.datetime "created_on",                                                   :null => false
  end

  create_table "group_order_article_quantities", :force => true do |t|
    t.integer  "group_order_article_id", :default => 0, :null => false
    t.integer  "quantity",               :default => 0
    t.integer  "tolerance",              :default => 0
    t.datetime "created_on",                            :null => false
  end

  create_table "group_order_articles", :force => true do |t|
    t.integer  "group_order_id",                                 :default => 0, :null => false
    t.integer  "order_article_id",                               :default => 0, :null => false
    t.integer  "quantity",                                       :default => 0, :null => false
    t.integer  "tolerance",                                      :default => 0, :null => false
    t.datetime "updated_on",                                                    :null => false
    t.decimal  "result",           :precision => 8, :scale => 3
  end

  add_index "group_order_articles", ["group_order_id", "order_article_id"], :name => "goa_index", :unique => true

  create_table "group_orders", :force => true do |t|
    t.integer  "ordergroup_id",                                    :default => 0,   :null => false
    t.integer  "order_id",                                         :default => 0,   :null => false
    t.decimal  "price",              :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "lock_version",                                     :default => 0,   :null => false
    t.datetime "updated_on",                                                        :null => false
    t.integer  "updated_by_user_id"
  end

  add_index "group_orders", ["ordergroup_id", "order_id"], :name => "index_group_orders_on_ordergroup_id_and_order_id", :unique => true

  create_table "groups", :force => true do |t|
    t.string   "type",                                              :default => "",    :null => false
    t.string   "name",                                              :default => "",    :null => false
    t.string   "description"
    t.decimal  "account_balance",     :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.datetime "account_updated"
    t.datetime "created_on",                                                           :null => false
    t.boolean  "role_admin",                                        :default => false, :null => false
    t.boolean  "role_suppliers",                                    :default => false, :null => false
    t.boolean  "role_article_meta",                                 :default => false, :null => false
    t.boolean  "role_finance",                                      :default => false, :null => false
    t.boolean  "role_orders",                                       :default => false, :null => false
    t.boolean  "weekly_task",                                       :default => false
    t.integer  "weekday"
    t.string   "task_name"
    t.string   "task_description"
    t.integer  "task_required_users",                               :default => 1
    t.datetime "deleted_at"
    t.string   "contact_person"
    t.string   "contact_phone"
    t.string   "contact_address"
    t.text     "stats"
  end

  add_index "groups", ["name"], :name => "index_groups_on_name", :unique => true

  create_table "invites", :force => true do |t|
    t.string   "token",      :default => "", :null => false
    t.datetime "expires_at",                 :null => false
    t.integer  "group_id",   :default => 0,  :null => false
    t.integer  "user_id",    :default => 0,  :null => false
    t.string   "email",      :default => "", :null => false
  end

  add_index "invites", ["token"], :name => "index_invites_on_token"

  create_table "invoices", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "delivery_id"
    t.integer  "order_id"
    t.string   "number"
    t.date     "date"
    t.date     "paid_on"
    t.text     "note"
    t.decimal  "amount",         :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "deposit",        :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "deposit_credit", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer "group_id", :default => 0, :null => false
    t.integer "user_id",  :default => 0, :null => false
  end

  add_index "memberships", ["user_id", "group_id"], :name => "index_memberships_on_user_id_and_group_id", :unique => true

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.text     "recipients_ids"
    t.string   "subject",                           :null => false
    t.text     "body"
    t.integer  "email_state",    :default => 0,     :null => false
    t.boolean  "private",        :default => false
    t.datetime "created_at"
  end

  create_table "order_articles", :force => true do |t|
    t.integer "order_id",         :default => 0, :null => false
    t.integer "article_id",       :default => 0, :null => false
    t.integer "quantity",         :default => 0, :null => false
    t.integer "tolerance",        :default => 0, :null => false
    t.integer "units_to_order",   :default => 0, :null => false
    t.integer "lock_version",     :default => 0, :null => false
    t.integer "article_price_id"
  end

  add_index "order_articles", ["order_id", "article_id"], :name => "index_order_articles_on_order_id_and_article_id", :unique => true

  create_table "order_comments", :force => true do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "supplier_id"
    t.text     "note"
    t.datetime "starts"
    t.datetime "ends"
    t.string   "state",                                            :default => "open"
    t.integer  "lock_version",                                     :default => 0,      :null => false
    t.integer  "updated_by_user_id"
    t.decimal  "foodcoop_result",    :precision => 8, :scale => 2
  end

  create_table "schema_info", :id => false, :force => true do |t|
    t.integer "version"
  end

  create_table "stock_changes", :force => true do |t|
    t.integer  "delivery_id"
    t.integer  "order_id"
    t.integer  "stock_article_id"
    t.integer  "quantity",         :default => 0
    t.datetime "created_at"
    t.integer  "stock_taking_id"
  end

  create_table "stock_takings", :force => true do |t|
    t.date     "date"
    t.text     "note"
    t.datetime "created_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name",               :default => "", :null => false
    t.string   "address",            :default => "", :null => false
    t.string   "phone",              :default => "", :null => false
    t.string   "phone2"
    t.string   "fax"
    t.string   "email"
    t.string   "url"
    t.string   "contact_person"
    t.string   "customer_number"
    t.string   "delivery_days"
    t.string   "order_howto"
    t.string   "note"
    t.integer  "shared_supplier_id"
    t.string   "min_order_quantity"
    t.datetime "deleted_at"
  end

  add_index "suppliers", ["name"], :name => "index_suppliers_on_name", :unique => true

  create_table "tasks", :force => true do |t|
    t.string   "name",           :default => "",    :null => false
    t.string   "description"
    t.date     "due_date"
    t.boolean  "done",           :default => false
    t.integer  "workgroup_id"
    t.boolean  "assigned",       :default => false
    t.datetime "created_on",                        :null => false
    t.datetime "updated_on",                        :null => false
    t.integer  "required_users", :default => 1
    t.boolean  "weekly"
  end

  add_index "tasks", ["due_date"], :name => "index_tasks_on_due_date"
  add_index "tasks", ["name"], :name => "index_tasks_on_name"

  create_table "users", :force => true do |t|
    t.string   "nick",                   :default => "", :null => false
    t.string   "password_hash",          :default => "", :null => false
    t.string   "password_salt",          :default => "", :null => false
    t.string   "first_name",             :default => "", :null => false
    t.string   "last_name",              :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "phone"
    t.datetime "created_on",                             :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_expires"
    t.datetime "last_login"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["nick"], :name => "index_users_on_nick", :unique => true

end
