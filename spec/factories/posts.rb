FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }

    trait :with_comments do
      after(:create) do |post, _evaluator|
        create_list(:comment, 10, post: post)
      end
    end
  end
end
