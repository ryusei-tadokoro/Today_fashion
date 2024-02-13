# spec/factories/users.rb
FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "user#{n}@example.com" }
      password { "password" }
      name { "p-chan" }  # ユーザーの名前を設定
    end
  end
  