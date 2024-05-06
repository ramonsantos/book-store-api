# frozen_string_literal: true

require 'rails_helper'

describe 'GET /health' do
  before { get(health_path) }

  it do
    expect(response).to have_http_status(:ok)
    expect(response.body).to eq('{"api":"OK"}')
  end
end
