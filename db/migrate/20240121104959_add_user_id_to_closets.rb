class AddUserIdToClosets < ActiveRecord::Migration[7.1]
  def change
    add_column :closets, :user_id, :integer
  end
end
