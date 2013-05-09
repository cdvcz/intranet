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

ActiveRecord::Schema.define(:version => 20130507123712) do

  create_table "demands", :force => true do |t|
    t.integer  "status"
    t.string   "number"
    t.string   "name"
    t.integer  "tax_year"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "employees", :force => true do |t|
    t.integer  "person_id"
    t.integer  "status"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employees_users", :id => false, :force => true do |t|
    t.integer "employee_id"
    t.integer "user_id"
  end

  create_table "people", :force => true do |t|
    t.integer  "status"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.string   "title_prefix"
    t.string   "title_suffix"
    t.integer  "sex"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer  "status"
    t.string   "number"
    t.string   "name"
    t.string   "name_en"
    t.string   "acronym"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["code"], :name => "index_roles_on_code"

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "registration_number"
    t.string   "registration_number_tax"
    t.string   "tax_registration"
    t.string   "email"
    t.string   "phone"
    t.string   "phone_cellular"
    t.string   "www"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "status"
    t.string   "name"
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
