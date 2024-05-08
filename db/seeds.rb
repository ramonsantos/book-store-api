# frozen_string_literal: true

if Rails.env.development?
  FactoryBot.create(:computer_science_category)
  FactoryBot.create(:history_category)

  author_1 = FactoryBot.create(:author)
  author_2 = FactoryBot.create(:author, name: 'Abraham Silberschatz')
  author_3 = FactoryBot.create(:author, name: 'Henry Korth')
  author_4 = FactoryBot.create(:author, name: 'Shashank Sudarshan')

  FactoryBot.create(:the_fall_of_berlin, authors: [author_1])
  FactoryBot.create(:database_system_concepts, authors: [author_2, author_3, author_4])

  FactoryBot.create(:admin)
  FactoryBot.create(:admin, :manager)
end
