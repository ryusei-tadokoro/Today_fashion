class CreateTodayMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :today_messages do |t|
      t.string :content

      t.timestamps
    end
  end
end
