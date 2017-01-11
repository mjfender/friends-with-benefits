class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :time
      t.text  :description
      t.integer :need_id
    end
  end
end
