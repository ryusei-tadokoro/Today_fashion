class CreateResidence < ActiveRecord::Migration[7.1]
  def change
    create_table :residences do |t|
      t.string :name
      t.timestamps
    end
  end
end
