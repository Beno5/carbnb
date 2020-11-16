class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.integer :price
      t.string :fuel_type
      t.float :consumption
      t.string :category
      t.integer :seat_number
      t.string :transmission
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
