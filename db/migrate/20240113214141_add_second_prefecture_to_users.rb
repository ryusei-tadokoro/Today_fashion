class AddSecondPrefectureToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :second_prefecture_id, :integer
  end
end
