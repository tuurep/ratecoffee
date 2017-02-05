class CreateCoffeeClubs < ActiveRecord::Migration
  def change
    create_table :coffee_clubs do |t|
      t.string :name
      t.integer :founded
      t.string :city
      t.string :string

      t.timestamps null: false
    end
  end
end
