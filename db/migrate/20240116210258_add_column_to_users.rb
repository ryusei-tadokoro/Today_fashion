class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string, null: false
    add_column :users, :second_prefecture_id, :integer
    add_column :users, :image, :string
  end
end
