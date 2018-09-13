FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    preview { Faker::LordOfTheRings.quote }
    description { Faker::Lorem.paragraph }
    author { Faker::Name.last_name }
    publisher { Book::PUBLISHERS.shuffle.first }
    year { SecureRandom.random_number(200) + (Time.zone.now.year - 200) }
  end
end
