class CreateResidence < ActiveRecord::Migration[7.1]
  def change
    create_table :residences do |t|
      t.integer :residence_name, null: false, default: 0
    end
  end
end
