# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  def destroy?
    user.manager?
  end
end
