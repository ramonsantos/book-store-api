# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE /sign_out' do
  let(:user) { create(:user) }

  let(:jwt_token) do
    user
    post(sign_in_path, headers: base_headers, params: { user: attributes_for(:user) }.to_json)
    response.parsed_body[:data][:token]
  end

  let(:headers_with_authorization) do
    base_headers.tap { |hash| hash['Authorization'] = "Bearer #{jwt_token}" }
  end

  it 'revokes token' do
    expect do
      delete(sign_out_path, headers: headers_with_authorization)
    end.to change(JwtDenyList, :count).by(1)

    expect(response).to have_http_status(:no_content)
    expect(response.body).to be_blank
  end
end
