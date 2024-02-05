# frozen_string_literal: true

class AddLastWornOnToClosets < ActiveRecord::Migration[7.1]
  def change
    add_column :closets, :last_worn_on, :date
  end
end
