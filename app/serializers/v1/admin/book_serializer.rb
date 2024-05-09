# frozen_string_literal: true

class V1::Admin::BookSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :description,
    :price,
    :cover_url,
    :isbn,
    :details,
    :category_id,
    :author_ids,
    :created_at,
    :slug
  )
end
