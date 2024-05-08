# frozen_string_literal: true

class V1::Admin::SessionsController < Devise::SessionsController
  include SessionsConcern
end
