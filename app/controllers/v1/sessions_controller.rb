# frozen_string_literal: true

class V1::SessionsController < Devise::SessionsController
  include SessionsConcern
end
