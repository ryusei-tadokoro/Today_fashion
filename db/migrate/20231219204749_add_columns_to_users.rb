class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, null: false
    add_reference :users, :residence, null: false, foreign_key: true
    add_reference :users, :additional_residence, null: false, foreign_key: true
    add_reference :users, :sensation, null: false, foreign_key: true
  end
end
