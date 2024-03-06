# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table(:books, id: :uuid) do |t|
      t.string :name, limit: 120
      t.text :description
      t.float :price
      t.string :cover_url, limit: 120
      t.string :isbn, limit: 13
      t.hstore :details
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index(:books, :isbn, unique: true)
    add_index(:books, :name)
  end
end
