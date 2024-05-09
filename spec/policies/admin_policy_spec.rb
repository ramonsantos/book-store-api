# frozen_string_literal: true

require 'rails_helper'

describe AdminPolicy, type: :policy do
  subject { described_class }

  permissions :destroy? do
    it 'grants access if admin user is manager' do
      expect(subject).to permit(Admin.new(role: :manager), Admin.new)
    end

    it 'denies access if admin user is editor' do
      expect(subject).not_to permit(Admin.new(role: :editor), Admin.new)
    end
  end
end
