class Share < ActiveRecord::Base
	belongs_to :user
	belongs_to :dailypost
	has_many :see_shares
end
