# frozen_string_literal: true

def parsed_response
  JSON.parse(response.body, symbolize_names: true) if response.body.present?
end

def base_headers
  {
    'Content-Type' => 'application/json',
    'Accept'       => 'application/json',
    'X-version'    => 'v1'
  }
end

def invalid_uuid
  '00000000-0000-0000-0000-000000000000'
end
