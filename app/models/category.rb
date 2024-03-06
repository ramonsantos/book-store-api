# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { maximum: 80 }
  validates :code, uniqueness: true, presence: true, length: { maximum: 80 }

  def self.identifier
    :category_code
  end
end
