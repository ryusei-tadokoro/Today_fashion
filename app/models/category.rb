# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :subcategories
  has_many :closets
end
