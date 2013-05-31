class LoserLike < ActiveRecord::Base
  attr_accessible :girl_id, :state, :title, :loser_id
  belongs_to :loser
  belongs_to :girl
end
