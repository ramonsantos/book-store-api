# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { 'user.test@gmail.com' }
    password { '123456' }
    role { 'editor' }

    trait :manager do
      role { 'manager' }
      email { 'admin.manager@email.com' }
    end

    factory :manager, traits: [:manager]
  end
end
