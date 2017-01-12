class AddMembershipsCountToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :memberships_count, :integer
  end
end
