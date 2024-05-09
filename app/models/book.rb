# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category

  has_many :author_books, dependent: :restrict_with_exception
  has_many :authors, through: :author_books

  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true
  validates :cover_url,   presence: true
  validates :authors,     presence: true
  validates :details,     presence: false
  validates :slug,        presence: true, uniqueness: { case_sensitive: true }

  validates :isbn,        presence: true,
                          uniqueness: { case_sensitive: false },
                          length: { is: 13 },
                          numericality: { only_integer: true }
end
