class AddTemperatureRangeToSubcategories < ActiveRecord::Migration[7.1]
  def change
    add_column :subcategories, :temperature_range, :string
  end
end
