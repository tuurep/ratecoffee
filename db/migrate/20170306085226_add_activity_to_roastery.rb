class AddActivityToRoastery < ActiveRecord::Migration
  def change
    add_column :roasteries, :active, :boolean
  end
end
