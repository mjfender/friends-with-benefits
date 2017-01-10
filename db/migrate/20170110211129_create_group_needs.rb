class CreateGroupNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :group_needs do |t|
      t.references :need, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
