ActiveRecord::Schema.define(:version => 0) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_preferences", :force => true do |t|
    t.integer  "emailable_id"
    t.string   "emailable_type"
    t.text     "settings"
    t.boolean  "unsubscribe_all"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_preferences", ["emailable_id", "emailable_type"], :name => "index_email_preferences_on_emailable_id_and_emailable_type"

end
