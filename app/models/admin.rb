# frozen_string_literal: true

class Admin < ApplicationRecord
  devise(
    :database_authenticatable,
    :validatable,
    :jwt_authenticatable,
    jwt_revocation_strategy: JwtDenyList
  )

  enum role: {
    editor:  'editor',
    manager: 'manager'
  }

  validates :role, presence: true
end
