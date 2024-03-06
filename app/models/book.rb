# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category

  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true
  validates :cover_url,   presence: true
  validates :details,     presence: false

  validates :isbn,        presence: true,
                          uniqueness: { case_sensitive: false },
                          length: { is: 13 },
                          numericality: { only_integer: true }
end
