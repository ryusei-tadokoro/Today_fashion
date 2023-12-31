class AddNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :residence_name, :string
    add_column :users, :additional_residence_name, :string
    add_column :users, :sensation_name, :string
  end
end
