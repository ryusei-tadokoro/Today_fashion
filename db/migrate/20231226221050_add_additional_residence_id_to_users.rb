class AddAdditionalResidenceIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :additional_residence, null: false, foreign_key: true
  end
end
