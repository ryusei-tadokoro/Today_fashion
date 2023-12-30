class AddSensationIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :sensation, null: false, foreign_key: true
  end
end
