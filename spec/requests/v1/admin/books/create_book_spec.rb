# frozen_string_literal: true

require 'rails_helper'

describe 'POST /admin/books' do
  let(:category) { create(:history_category) }
  let(:author) { create(:author) }
  let(:isbn) { '9780345215802' }
  let(:category_id) { category.id }
  let(:name) { 'The Fall of Berlin' }

  let(:book_params) do
    {
      name:,
      description: 'Book Description',
      price: 10.0,
      cover_url: 'https://example.com/cover.jpg',
      isbn:,
      slug: 'the-fall-of-berlin',
      details: {
        number_of_pages: 414,
        year: '1969',
        original_name: 'Конец третьего рейха'
      },
      category_id:,
      author_ids: [author.id]
    }
  end

  let(:params) do
    {
      book: book_params
    }
  end

  before { Timecop.freeze(Time.zone.parse('2024-05-09 16:33:13')) }

  context 'when successful' do
    let(:expected_response) do
      {
        id: /^\h{8}-(\h{4}-){3}\h{12}$/,
        cover_url: 'https://example.com/cover.jpg',
        created_at: '2024-05-09T16:33:13.000Z',
        description: 'Book Description',
        details: { number_of_pages: '414', original_name: 'Конец третьего рейха', year: '1969' },
        isbn: '9780345215802',
        name: 'The Fall of Berlin',
        price: 10.0,
        slug: 'the-fall-of-berlin',
        author_ids: [author.id],
        category_id: category.id
      }
    end

    it do
      expect do
        post(admin_books_path, headers: headers_authorization(base_headers, create(:admin)), params: params.to_json)
      end.to change(Book, :count).from(0).to(1)

      expect(response).to have_http_status(:created)
      expect(parsed_response).to match(expected_response)
    end
  end

  context 'when error' do
    context 'when unauthorized error' do
      let(:expected_response) do
        {
          errors: [
            {
              title: 'Unauthorized',
              detail: 'Invalid Email or password.',
              code: 'unauthorized'
            }
          ],
          meta: {}
        }
      end

      it do
        expect do
          post(admin_books_path, headers: base_headers, params: params.to_json)
        end.not_to change(Book, :count)

        expect(response).to have_http_status(:unauthorized)
        expect(parsed_response).to eq(expected_response)
      end
    end

    context 'when unprocessable entity error' do
      let(:isbn) { '0r' }
      let(:category_id) { invalid_uuid }
      let(:name) { '' }

      let(:expected_errors) do
        [
          {
            code: 'resource_does_not_exist',
            detail: 'The Category does not exist',
            title: 'Resource does not exist'
          },
          {
            title: 'Attribute with the wrong length',
            detail: "The attribute 'isbn' is the wrong length (should be 13 characters)",
            code: 'wrong_length_attribute'
          },
          {
            title: 'Attribute is not a number',
            detail: "The attribute 'isbn' is not a number",
            code: 'attribute_is_not_a_number'
          },
          {
            code: 'attribute_blank',
            detail: "The attribute 'name' can't be blank",
            title: 'Attribute is required'
          }
        ]
      end

      let(:expected_response) do
        {
          errors: match_array(expected_errors),
          meta: {}
        }
      end

      it do
        expect do
          post(admin_books_path, headers: headers_authorization(base_headers, create(:admin)), params: params.to_json)
        end.not_to change(Book, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(parsed_response).to match(expected_response)
      end
    end
  end
end
