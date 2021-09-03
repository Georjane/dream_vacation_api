FactoryBot.define do
  factory :hotel do
    title { Faker::Hotel.title }
    description { Faker::Hotel.author }
    image_url { Faker::Hotel.author }
  end
 end