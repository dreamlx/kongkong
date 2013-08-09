ActiveAdmin.register Share do
	index do
		column :id
		column :user_id
		column :dailypost_id
		column :photo_url
		column :active_times
		default_actions
	end
end
