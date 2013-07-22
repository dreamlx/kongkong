class LoserLike < ActiveRecord::Base
  attr_accessible :dailypost_id, :state, :title, :loser_id
  belongs_to :loser
  belongs_to :dailypost
end
