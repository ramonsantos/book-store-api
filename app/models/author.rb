# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :author_books, dependent: :restrict_with_exception
  has_many :books, through: :author_books

  validates :name, presence: true, length: { maximum: 80 }
end
