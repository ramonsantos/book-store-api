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

ActiveRecord::Schema[7.1].define(version: 2024_03_06_222344) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "author_books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "book_id", null: false
    t.uuid "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_author_books_on_author_id"
    t.index ["book_id"], name: "index_author_books_on_book_id"
  end

  create_table "authors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 80
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 120
    t.text "description"
    t.float "price"
    t.string "cover_url", limit: 120
    t.string "isbn", limit: 13
    t.hstore "details"
    t.uuid "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
    t.index ["name"], name: "index_books_on_name"
  end

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 80
    t.string "code", limit: 80
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_categories_on_code", unique: true
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  add_foreign_key "author_books", "authors"
  add_foreign_key "author_books", "books"
  add_foreign_key "books", "categories"
end
