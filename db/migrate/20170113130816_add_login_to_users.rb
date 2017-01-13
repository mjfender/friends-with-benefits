class AddLoginToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :logins_count, :integer, :default => 0
    #intended to count number of days user has been active on site
    add_column :users, :logins_last, :datetime
    #updated every 'new day' user is logged in
  end
end
