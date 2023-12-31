class CreateSensation < ActiveRecord::Migration[7.1]
  def change
    create_table :sensations do |t|
      t.integer :sensation_name, null: false, default: 0
    end
  end
end
