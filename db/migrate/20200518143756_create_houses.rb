class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :location
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
