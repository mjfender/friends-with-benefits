class AddRequestAdminToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :request_admin, :datetime
  end
end
