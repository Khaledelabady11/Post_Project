FactoryBot.define do
  factory :comment do
    commenter { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    post { association(:post) }
  end
end
