FactoryBot.define do
  factory :comment do
    commenter { Faker::Lorem.sentence }
    body {  Faker::Lorem.paragraph   }
    post { nil }
  end

  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
end
