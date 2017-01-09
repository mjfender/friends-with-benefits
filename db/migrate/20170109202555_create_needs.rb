class CreateNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :needs do |t|
      t.belongs_to :human
      t.string :headline
      t.text :description
      t.datetime :expiration
      t.text :perk
      t.boolean :completed, default: false
      t.timestamps null: false
    end
  end
end
