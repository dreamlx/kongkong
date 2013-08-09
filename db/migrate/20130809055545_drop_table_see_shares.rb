class DropTableSeeShares < ActiveRecord::Migration
  def change
  	drop_table :see_shares
  end
end
