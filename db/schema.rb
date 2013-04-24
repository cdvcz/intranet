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

ActiveRecord::Schema.define(:version => 20130424131107) do

  create_table "employees", :force => true do |t|
    t.string   "number"
    t.string   "first_name"
    t.string   "surname"
    t.string   "title_prefix"
    t.string   "title_suffix"
    t.string   "job"
    t.string   "email"
    t.string   "phone"
    t.string   "phone_cellular"
    t.string   "employed_from"
    t.string   "employed_to"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
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
    t.string   "login_username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "login_showname"
    t.boolean  "login_allowed"
    t.datetime "login_last"
    t.string   "login_password_old"
    t.datetime "login_password_last_changed"
    t.integer  "employee_id"
    t.string   "login_redirect_to"
  end

end
