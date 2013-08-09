class AddColumnActiveTimeToShares < ActiveRecord::Migration
  def change
  	add_column :shares,:active_times,:integer
  end
end
