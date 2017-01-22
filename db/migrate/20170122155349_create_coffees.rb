class CreateCoffees < ActiveRecord::Migration
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :style
      t.integer :roastery_id

      t.timestamps null: false
    end
  end
end
