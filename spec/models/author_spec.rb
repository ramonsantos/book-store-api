# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author do
  describe 'associations' do
    it { is_expected.to have_many(:author_books).dependent(:restrict_with_exception) }
    it { is_expected.to have_many(:books).through(:author_books) }
  end

  describe 'validations' do
    context 'when presence_of' do
      it { is_expected.to validate_presence_of(:name) }
    end

    context 'when length_of' do
      it { is_expected.to validate_length_of(:name).is_at_most(80) }
    end
  end
end
