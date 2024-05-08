# frozen_string_literal: true

require 'rails_helper'

describe 'POST /log_in' do
  before do
    create(:user)
    post(sign_in_path, headers: base_headers, params: params.to_json)
  end

  context 'when correct credentials' do
    let(:params) do
      {
        user: { email: 'user.test@gmail.com', password: '123456' }
      }
    end

    let(:expected_response) do
      {
        data: {
          token: /[a-zA-Z0-9\-_]+?\.[a-zA-Z0-9\-_]+?\.[a-zA-Z0-9\-_]+$/
        },
        meta: {}
      }
    end

    it 'creates token' do
      expect(response).to have_http_status(:created)
      expect(parsed_response).to match(expected_response)
    end
  end

  context 'when invalid credentials' do
    let(:params) do
      { email: 'user123@gmail.com', password: 'as123456' }
    end

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

    it 'does not create token' do
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_response).to eq(expected_response)
    end
  end
end
