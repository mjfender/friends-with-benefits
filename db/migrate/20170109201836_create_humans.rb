class CreateHumans < ActiveRecord::Migration[5.0]
  def change
    create_table :humans do |t|
      t.string :name
      t.string :email, unique: true
      t.string :password_digest
      t.text :bio
      t.string :photo
      t.string :zipcode
      t.timestamps null: false
    end
  end
end
