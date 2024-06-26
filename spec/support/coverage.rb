# frozen_string_literal: true

require 'simplecov'

SimpleCov.start(:rails) do
  add_filter '/app/mailers/'
end

SimpleCov::MINIMUM_COVERAGE = 95
SimpleCov.minimum_coverage(SimpleCov::MINIMUM_COVERAGE)
