# spec/factories/subcategories.rb
FactoryBot.define do
  factory :subcategory do
    sequence(:name) { |n| "サブカテゴリ#{n}" }
    association :category
  end
end
