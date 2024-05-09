# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    category { Category.find_by(code: 'history') || create(:history_category) }
    authors { [Author.first || build(:author)] }

    name { 'The Fall of Berlin' }
    price { 59.99 }
    cover_url { 'https://m.media-amazon.com/images/I/91PUjmVo3kL._SY466_.jpg' }
    isbn { '9780345215802' }
    slug { 'the-fall-of-berlin' }

    details do
      {
        number_of_pages: 414,
        year: '1969',
        original_name: 'Конец третьего рейха'
      }
    end

    description do
      <<~CONTENT
        Vasiliy Chuikov was still breathing at the end, every soldier’s desire. This account of the operations of his army on the Eastern Front from the summer of 1944 until the surrender of Germany is not as dramatic as his history of Stalingrad. As Chuikov himself said, Stalingrad was ‘idiosyncratic.’ No one had ever seen the like and, with a bit of luck, no one will ever see the like again.
        This book relates many stories, but also contains a fair amount of detailed military reporting. If the small-town geography of Poland and Ukraine becomes too tedious, skim it. This book can educate those who do not fully appreciate the sacrifice made by Red Army troops in World War II. Russians of the Soviet period almost always failed in their appeals for understanding by painting themselves as courageous, kind, etc. etc., when they weren’t painting themselves as poor and pitiable. Of course, they were neither angelic nor universally victimized. You will find the ‘courageous and kind…’ version here. Chuikov’s propaganda on the benevolent fraternity enjoyed by Russians and Poles is nauseating.
        Even so, I think the general was an honest man, as honest as he could be under the circumstances. Recall that he survived Stalin’s great purge of the military in the late 1930s. He may have been just the right age, a fish too small to be noticed at the time. However, the warning that a firing squad could be at the other end of a piddling mistake—or possibly no mistake at all—could not have been missed. Chuikov became a master at criticizing ambiguously. His little shots at Marshal Zhukov are delightfully crafted. An out-of-print English translation of this book is available, but it is deeply flawed. I’m sure I made a few mistakes, but I hope a better version will be welcomed.
      CONTENT
    end

    trait :database_system_concepts do
      category { Category.find_by(code: 'computer-science') || create(:computer_science_category) }

      name { 'Database System Concepts' }
      price { 106.5 }
      cover_url { 'https://m.media-amazon.com/images/I/61aEyYvsBmL._SY466_.jpg' }
      isbn { '9781260084504' }
      slug { 'database-system-concepts' }

      details do
        {
          number_of_pages: 2752,
          year: '1969',
          edition: '7ª'
        }
      end

      description do
        <<~CONTENT
          Database System Concepts by Silberschatz, Korth and Sudarshan is now in its 7th edition and is one of the cornerstone texts of database education. It presents the fundamental concepts of database management in an intuitive manner geared toward allowing students to begin working with databases as quickly as possible.
          The text is designed for a first course in databases at the junior/senior undergraduate level or the first year graduate level. It also contains additional material that can be used as supplements or as introductory material for an advanced course. Because the authors present concepts as intuitive descriptions, a familiarity with basic data structures, computer organization, and a high-level programming language are the only prerequisites. Important theoretical results are covered, but formal proofs are omitted. In place of proofs, figures and examples are used to suggest why a result is true.
        CONTENT
      end
    end

    factory :the_fall_of_berlin
    factory :database_system_concepts, traits: [:database_system_concepts]
  end
end
