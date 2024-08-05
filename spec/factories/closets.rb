# spec/factories/closets.rb
FactoryBot.define do
  factory :closet do
    name { 'Tシャツ' }
    category
    subcategory
    association :user
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test_image.png'), 'image/png') }
  end
end
