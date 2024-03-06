# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name, limit: 80
      t.string :code, limit: 80
      t.timestamps
    end
  end
end
