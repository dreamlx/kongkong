class AddColumnDailypostsIdToLoserLikes < ActiveRecord::Migration
  def change
  	add_column :loser_likes, :dailypost_id,:integer
  end
end
