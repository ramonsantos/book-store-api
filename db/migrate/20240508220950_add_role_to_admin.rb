# frozen_string_literal: true

class AddRoleToAdmin < ActiveRecord::Migration[7.1]
  def change
    add_column(:admins, :role, :string, default: 'editor')
  end
end
