# frozen_string_literal: true

class V1::Admin::BooksController < V1::Admin::BaseController
  before_action :authenticate_admin!

  # POST /admin/books
  def create
    render(json: V1::Admin::BookSerializer.new(created_book).serializable_hash, status: :created)
  end

  private

  def created_book
    Book.create!(book_params)
  end

  def book_params
    params.require(:book).permit(
      :name,
      :price,
      :description,
      :isbn,
      :category_id,
      :cover_url,
      :slug,
      details: {},
      author_ids: []
    )
  end
end
