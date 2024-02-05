# frozen_string_literal: true

json.extract! closet, :id, :name, :category_id, :subcategory_id, :purchase_date, :size, :color, :purchase_location,
              :price, :usage_frequency, :season, :other_comments, :image, :created_at, :updated_at
json.url closet_url(closet, format: :json)
