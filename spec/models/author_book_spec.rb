# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthorBook do
  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:author) }
  end
end
