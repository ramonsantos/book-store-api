# frozen_string_literal: true

class HealthController < ApplicationController
  # GET /health
  def index
    render(json: { api: 'OK' }, status: :ok)
  end
end
