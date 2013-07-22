class RenameColumnGirlIdToDailypostId < ActiveRecord::Migration
  def change
  	rename_column :loser_likes, :girl_id, :dailypost_id
  end

end
