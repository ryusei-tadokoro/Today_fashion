# frozen_string_literal: true

# spec/factories/closets.rb
FactoryBot.define do
  factory :closet do
    association :user
    sequence(:name) { |n| "Closet #{n}" }
    category_id { create(:category).id }
    subcategory_id { create(:subcategory).id }
    purchase_date { Date.today }
    size { 'M' }
    color { 'Red' }
    purchase_location { 'Tokyo' }
    price { 1000 }
    usage_frequency { 3 }
    season { '春' }
    other_comments { 'No comments' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test_image.png'), 'image/png') }
  end
end
