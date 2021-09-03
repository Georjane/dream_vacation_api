FactoryBot.define do
  factory :hotel do
    title { Faker::Lorem.word }
    description { Faker::Lorem.word }
    image_url { Faker::Lorem.word }
  end
 end