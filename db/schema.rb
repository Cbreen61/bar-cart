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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210109010800) do

  create_table "cocktails", force: :cascade do |t|
    t.string  "title"
    t.text    "method"
    t.string  "image",   default: "https://images.pexels.com/photos/1283219/pexels-photo-1283219.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
    t.integer "user_id"
  end

  create_table "cocktails_ingredients", force: :cascade do |t|
    t.integer "cocktail_id"
    t.integer "ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
