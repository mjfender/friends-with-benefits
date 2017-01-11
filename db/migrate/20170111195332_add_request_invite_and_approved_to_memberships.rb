class AddRequestInviteAndApprovedToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :request_invite, :datetime
    add_column :memberships, :approved, :boolean
  end
end
