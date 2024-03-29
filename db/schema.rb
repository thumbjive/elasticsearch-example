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

ActiveRecord::Schema.define(version: 20170513004510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "published_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "abstract"
    t.string "url"
    t.integer "shares"
  end

  create_table "articles_categories", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "category_id"
    t.index ["article_id"], name: "index_articles_categories_on_article_id"
    t.index ["category_id"], name: "index_articles_categories_on_category_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorships", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_authorships_on_article_id"
    t.index ["author_id"], name: "index_authorships_on_author_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.string "user"
    t.string "user_location"
    t.integer "stars"
    t.boolean "pick"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  add_foreign_key "articles_categories", "articles"
  add_foreign_key "articles_categories", "categories"
  add_foreign_key "authorships", "articles"
  add_foreign_key "authorships", "authors"
  add_foreign_key "comments", "articles"
end
