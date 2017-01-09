class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.belongs_to :user
      t.belongs_to :need
      t.text :comment
      t.boolean :yes
      t.timestamps null: false
    end
  end
end
