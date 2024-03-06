# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book do
  describe 'associations' do
    it { is_expected.to belong_to(:category) }
  end

  describe 'validations' do
    context 'when presence_of' do
      context 'when true' do
        it { is_expected.to validate_presence_of(:name) }
        it { is_expected.to validate_presence_of(:price) }
        it { is_expected.to validate_presence_of(:description) }
        it { is_expected.to validate_presence_of(:isbn) }
        it { is_expected.to validate_presence_of(:cover_url) }
      end

      context 'when false' do
        it { is_expected.not_to validate_presence_of(:details) }
      end
    end

    context 'when uniqueness_of' do
      subject { build(:book) }

      it { is_expected.to validate_uniqueness_of(:isbn).case_insensitive }
    end

    context 'when validate_length_of' do
      it { is_expected.to validate_length_of(:isbn).is_equal_to(13) }
    end

    context 'when validates_numericality_of' do
      it { is_expected.to validate_numericality_of(:isbn).only_integer }
    end
  end
end
