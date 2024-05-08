# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { 'user.test@gmail.com' }
    password { '123456' }
  end
end
