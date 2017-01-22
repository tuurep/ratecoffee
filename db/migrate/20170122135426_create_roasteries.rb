class CreateRoasteries < ActiveRecord::Migration
  def change
    create_table :roasteries do |t|
      t.string :name
      t.integer :year

      t.timestamps null: false
    end
  end
end
