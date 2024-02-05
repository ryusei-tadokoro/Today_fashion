# frozen_string_literal: true

class CreateClosets < ActiveRecord::Migration[7.1]
  def change
    create_table :closets do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true
      t.date :purchase_date
      t.string :size
      t.string :color
      t.string :purchase_location
      t.decimal :price
      t.integer :usage_frequency
      t.string :season
      t.text :other_comments
      t.string :image

      t.timestamps
    end
  end
end
