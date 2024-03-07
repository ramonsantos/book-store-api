# frozen_string_literal: true

class AddUniquenessIndexesToCategory < ActiveRecord::Migration[7.1]
  def change
    add_index(:categories, :code, unique: true)
    add_index(:categories, :name, unique: true)
  end
end
