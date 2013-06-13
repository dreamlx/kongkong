class AddStateToDailypost < ActiveRecord::Migration
  def change
    add_column :dailyposts, :state, :string
  end
end
