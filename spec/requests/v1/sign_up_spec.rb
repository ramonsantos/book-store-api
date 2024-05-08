# frozen_string_literal: true

require 'rails_helper'

describe 'POST /sign_up' do
  let(:params) { { email: 'user.test@gmail.com', password: '123456' } }

  context 'when success' do
    let(:expected_response) do
      {
        data: nil,
        meta: {
          info: 'User created with success.'
        }
      }
    end

    it do
      expect do
        post(sign_up_path, headers: base_headers, params: params.to_json)
      end.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(parsed_response).to eq(expected_response)
    end
  end

  context 'when error' do
    context 'when BadRequest error' do
      let(:params) { { password: '123456' } }

      let(:expected_response) do
        {
          errors: [
            {
              title: 'Attribute is required',
              detail: "The attribute 'email' can't be blank",
              code: 'attribute_blank'
            }
          ],
          meta: {}
        }
      end

      it do
        expect do
          post(sign_up_path, headers: base_headers, params: params.to_json)
        end.not_to change(User, :count)

        expect(response).to have_http_status(:bad_request)
        expect(parsed_response).to eq(expected_response)
      end
    end

    context 'when UnprocessableEntity error' do
      context 'when User already exists' do
        let(:expected_response) do
          {
            errors: [
              {
                title: 'Resource already exists',
                detail: 'The User already exists',
                code: 'resource_already_exists'
              }
            ],
            meta: {}
          }
        end

        before { create(:user) }

        it do
          expect do
            post(sign_up_path, headers: base_headers, params: params.to_json)
          end.not_to change(User, :count)

          expect(response).to have_http_status(:unprocessable_entity)
          expect(parsed_response).to eq(expected_response)
        end
      end

      context 'when password is too short' do
        let(:params) { { email: 'user.test@gmail.com', password: '12345' } }

        let(:expected_response) do
          {
            errors: [
              {
                title: 'Attribute too short',
                detail: "The attribute 'password' is too short (minimum is 6 characters)",
                code: 'attribute_too_short'
              }
            ],
            meta: {}
          }
        end

        it do
          expect do
            post(sign_up_path, headers: base_headers, params: params.to_json)
          end.not_to change(User, :count)

          expect(response).to have_http_status(:unprocessable_entity)
          expect(parsed_response).to eq(expected_response)
        end
      end
    end
  end
end
