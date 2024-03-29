# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development?
  FactoryBot.create(:computer_science_category)
  FactoryBot.create(:history_category)

  author_1 = FactoryBot.create(:author)
  author_2 = FactoryBot.create(:author, name: 'Abraham Silberschatz')
  author_3 = FactoryBot.create(:author, name: 'Henry Korth')
  author_4 = FactoryBot.create(:author, name: 'Shashank Sudarshan')

  FactoryBot.create(:the_fall_of_berlin, authors: [author_1])
  FactoryBot.create(:database_system_concepts, authors: [author_2, author_3, author_4])
end
