# frozen_string_literal: true

require 'rails_helper'

describe Category do
  describe 'associations' do
    context 'when have_many' do
      it { is_expected.to have_many(:books).dependent(:restrict_with_exception) }
    end
  end

  describe 'validations' do
    context 'when presence_of' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:code) }
    end

    context 'when length_of' do
      it { is_expected.to validate_length_of(:name).is_at_most(80) }
      it { is_expected.to validate_length_of(:code).is_at_most(80) }
    end

    context 'when uniqueness_of' do
      subject { build(:category) }

      it { is_expected.to validate_uniqueness_of(:name) }
      it { is_expected.to validate_uniqueness_of(:code) }
    end
  end

  describe '.identifier' do
    it { expect(described_class.identifier).to eq(:category_code) }
  end
end
