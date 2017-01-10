class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.boolean :open, default: true
      t.string :title
      t.text :description
      t.attachment :photo
      t.string :location

      t.timestamps
    end
  end
end
