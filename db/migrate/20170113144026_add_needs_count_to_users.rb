class AddNeedsCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :needs_count, :integer
  end
end
