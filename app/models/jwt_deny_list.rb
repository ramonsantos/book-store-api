# frozen_string_literal: true

class JwtDenyList < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
end
