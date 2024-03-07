# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table(:authors, id: :uuid) do |t|
      t.string(:name, limit: 80)

      t.timestamps
    end
  end
end
