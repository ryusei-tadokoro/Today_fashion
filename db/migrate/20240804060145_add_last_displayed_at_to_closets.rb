class AddLastDisplayedAtToClosets < ActiveRecord::Migration[7.1]
  def change
    add_column :closets, :last_displayed_at, :datetime
  end
end
