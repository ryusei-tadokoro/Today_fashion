class CreateAdditionalResidence < ActiveRecord::Migration[7.1]
  def change
    create_table :additional_residences do |t|
      t.integer :additional_regsidence_name, null: false, default: 0
    end
  end
end
