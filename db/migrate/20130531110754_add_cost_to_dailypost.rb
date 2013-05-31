class AddCostToDailypost < ActiveRecord::Migration
  def change
    add_column :dailyposts, :cost, :integer, defult: 0
  end
end
