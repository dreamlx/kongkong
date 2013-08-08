class AddColoumShareTimeToDailyposts < ActiveRecord::Migration
  def change
  	add_column :dailyposts,:share_time,:integer
  end
end
