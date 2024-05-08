# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin do
  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  it do
    expect(subject).to define_enum_for(:role).with_values(
      editor:  'editor',
      manager: 'manager'
    ).backed_by_column_of_type(:string)
  end
end
