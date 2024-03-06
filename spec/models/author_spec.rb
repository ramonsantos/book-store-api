# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author do
  describe 'validations' do
    context 'when presence_of' do
      it { is_expected.to validate_presence_of(:name) }
    end

    context 'when length_of' do
      it { is_expected.to validate_length_of(:name).is_at_most(80) }
    end
  end
end
