class CreateSensation < ActiveRecord::Migration[7.1]
  def change
    create_table :sensations do |t|
      t.string :name
      t.timestamps
    end
  end
end
