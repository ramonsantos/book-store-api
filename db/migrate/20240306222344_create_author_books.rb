# frozen_string_literal: true

class CreateAuthorBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :author_books, id: :uuid do |t|
      t.references :book, null: false, foreign_key: true, type: :uuid
      t.references :author, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
