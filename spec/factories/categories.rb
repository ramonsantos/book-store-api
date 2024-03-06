# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { 'Computer science' }
    code { 'computer-science' }

    trait :history_category do
      name { 'History' }
      code { 'history' }
    end

    factory :computer_science_category
    factory :history_category, traits: [:history_category]
  end
end
