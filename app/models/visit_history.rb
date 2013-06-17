class VisitHistory < ActiveRecord::Base
  attr_accessible :dailypost_id, :state, :user_id, :visit_count
  belongs_to :dailypost
  belongs_to :user
end
