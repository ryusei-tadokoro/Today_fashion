class CreateAdditionalResidence < ActiveRecord::Migration[7.1]
  def change
    create_table :additional_residences do |t|
      t.string :name
      t.timestamps
    end
  end
end
