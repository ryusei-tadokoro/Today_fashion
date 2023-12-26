class CreateResidence < ActiveRecord::Migration[7.1]
  def change
    create_table :residences do |t|
      t.integer :residence_id, null: false, default: 0
    end
  end
end
